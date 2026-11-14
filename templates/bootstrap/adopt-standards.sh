#!/bin/sh
# Copyright 2026 Susana Vázquez
# SPDX-License-Identifier: Apache-2.0
set -eu

fail() {
    printf '%s\n' "$*" >&2
    exit 1
}

template_dir=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
agents_template="$template_dir/AGENTS.md"
upstream=https://github.com/svazquezco/engineering-standards.git
raw=https://raw.githubusercontent.com/svazquezco/engineering-standards
vendor=vendor/engineering-standards

[ "$#" -le 1 ] || fail "Usage: $0 [links|subtree|submodule]"
mode=${1:-}
if [ -z "$mode" ]; then
    printf '%s\n' 'How should this project adopt the engineering standards?' \
        '  1. Pinned links (default)' \
        '  2. Git subtree (included in each clone)' \
        '  3. Git submodule (initialize on checkout)'
    printf 'Choose [1]: '
    IFS= read -r choice || fail 'No selection received. Pass links, subtree, or submodule explicitly.'
    case "$choice" in
        ''|1) mode=links ;;
        2) mode=subtree ;;
        3) mode=submodule ;;
        *) fail 'Choose 1, 2, or 3.' ;;
    esac
fi

case "$mode" in
    links|subtree|submodule) ;;
    *) fail "Unknown adoption mode: $mode" ;;
esac

[ ! -e AGENTS.md ] && [ ! -L AGENTS.md ] ||
    fail 'AGENTS.md already exists. Follow the manual adoption instructions to preserve it.'

tag=$(sed -n "s|.*$raw/\([^/]*\)/standards/.*|\1|p" "$agents_template" | sort -u)
printf '%s\n' "$tag" | awk 'NR != 1 || !/^v[0-9]+[.][0-9]+[.][0-9]+$/ { bad = 1 } END { exit (NR != 1 || bad) }' ||
    fail 'The AGENTS.md template must use one published version tag.'

if [ "$mode" != links ]; then
    root=$(git rev-parse --show-toplevel 2>/dev/null) ||
        fail 'Initialize a Git repository before choosing a vendored option.'
    [ "$root" = "$(pwd -P)" ] || fail 'Run this command from the repository root.'
    [ ! -e "$vendor" ] && [ ! -L "$vendor" ] ||
        fail "$vendor already exists."
fi

case "$mode" in
    subtree)
        git rev-parse --verify HEAD >/dev/null 2>&1 ||
            fail 'Create the initial commit before choosing a Git subtree.'
        [ -z "$(git status --porcelain)" ] || fail 'Commit or stash changes before adding a subtree.'
        git subtree add --prefix "$vendor" "$upstream" "$tag" --squash
        ;;
    submodule)
        git ls-remote --exit-code --refs "$upstream" "refs/tags/$tag" >/dev/null ||
            fail "Cannot resolve the published tag $tag."
        git submodule add -- "$upstream" "$vendor"
        git -C "$vendor" checkout --detach "refs/tags/$tag"
        git add -- "$vendor"
        ;;
esac

if [ "$mode" = links ]; then
    cp "$agents_template" AGENTS.md
else
    sed -e "s|$raw/$tag/standards/|$vendor/standards/|g" \
        -e '/^Read the relevant linked standards/,/^use the local paths instead/c\
Read the relevant linked standards before working on a task. The project\
tracks a local copy of the shared standards. If a file is unavailable, report\
the limitation.
' "$agents_template" > AGENTS.md
fi

if [ ! -e CLAUDE.md ] && [ ! -L CLAUDE.md ]; then
    cp "$template_dir/CLAUDE.md" CLAUDE.md
fi
printf 'Configured standards adoption using %s (%s).\n' "$mode" "$tag"
