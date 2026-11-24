# Reference these standards

Add the relevant links from [templates/AGENTS.md](../templates/AGENTS.md) to the
consuming project’s AGENTS.md. Keep its existing project instructions. Copy
[templates/CLAUDE.md](../templates/CLAUDE.md) as well: Claude Code reads
CLAUDE.md, which imports AGENTS.md.

## Choose an adoption method

1. **Pinned links (default).** Use raw Markdown URLs pinned to one published
   tag or full commit SHA when people and agents can access the central
   repository. Use the same reference in every link.
2. **Git subtree.** Choose this when every checkout must include the standards.
   Import the selected revision under `vendor/engineering-standards/` and link
   to local paths. Keep project-specific exceptions outside that directory.
3. **Git submodule.** Choose this when you control checkout setup and want to
   track the exact upstream commit separately. Initialize the submodule in fresh
   clones with `git submodule update --init --recursive`.

Use links to `main` only when a project deliberately tracks unreleased changes.
Plugins can automate setup and use the references declared by the project.

## Set up a new project

From the new project's root, run the following script from a checkout of this
repository. It asks which adoption method to use and creates `AGENTS.md` with
the corresponding links. It also creates `CLAUDE.md` if it is missing.

```sh
sh /path/to/engineering-standards/templates/bootstrap/adopt-standards.sh
```

Pass `links`, `subtree`, or `submodule` to select the method non-interactively.
The script uses the published tag in the bundled template. The subtree option
requires a clean Git checkout with an initial commit and creates import commits.
The submodule option initializes the upstream checkout and stages `.gitmodules`
and the pinned commit. Both options require access to the upstream repository
during setup. Review and commit the generated project files.

If `AGENTS.md` already exists, add the relevant template references manually
to preserve the project's instructions.

## Project documentation

Use [the README template](../templates/README.md) for the project title,
purpose, and documentation links. Keep the same standards revision in README.md
and AGENTS.md. If you selected a vendored copy, use relative links to it.

Create architecture, contributing, and testing guides under `docs/`. Add
`docs/local-development.md` if the project has a local development environment
and `docs/usage.md` if it provides an application, CLI, API, or library. Link
each applicable guide from README.md.

Skills and tools can discover the standards and their scopes from
[standards/index.json](../standards/index.json).

For example:

<!-- x-release-please-start-version -->

```markdown
## Engineering standards

Read the relevant linked standards before working on a task:

- [Documentation](https://raw.githubusercontent.com/svazquezco/engineering-standards/v4.0.0/standards/documentation.md)
- [Python coding](https://raw.githubusercontent.com/svazquezco/engineering-standards/v4.0.0/standards/python-coding.md)
- [Python unit tests](https://raw.githubusercontent.com/svazquezco/engineering-standards/v4.0.0/standards/python-testing.md)
- [Dependencies](https://raw.githubusercontent.com/svazquezco/engineering-standards/v4.0.0/standards/dependencies.md)
```

<!-- x-release-please-end -->

This repository is the canonical source. Keep vendored copies tied to a
published revision. Keep project-specific setup, validation commands,
and exceptions in the consuming project’s documentation. Agents must open and
read the relevant links; if access fails, they must report it.

## Initial Python configuration

Follow [Start a Python project](python-projects.md) to set up uv, Ruff,
wemake, Pyright, pytest, pre-commit, and CI.

## Reference a fixed version

<!-- x-release-please-start-version -->

Templates pin every link to the same published tag, such as `v4.0.0`:

```text
https://raw.githubusercontent.com/svazquezco/engineering-standards/v4.0.0/standards/documentation.md
```

<!-- x-release-please-end -->

Check the repository’s published tags before choosing a version. See
[versioning](versioning.md) for publication and upgrade steps.

## Following updates

Links to `main` follow the current standards, including breaking changes, the
next time the documents are read. Prefer a pinned tag.

Projects using a fixed tag or commit SHA upgrade explicitly: review the changes
and migration steps, update all standards references together, and run the
project’s validation commands.

## Precedence and exceptions

Explicit task instructions take precedence over the shared defaults. A consuming
repository’s documented local rules override the shared defaults. Record each
exception in its AGENTS.md or docs/contributing.md with the affected standard,
replacement rule, and reason. Report conflicts rather than silently combining
incompatible requirements.
