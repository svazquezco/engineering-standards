# Reference these standards

Add the relevant links from [templates/AGENTS.md](../templates/AGENTS.md) to the
consuming project’s AGENTS.md. Keep its existing project instructions. Copy
[templates/CLAUDE.md](../templates/CLAUDE.md) as well: Claude Code reads
CLAUDE.md, which imports AGENTS.md.

Reference the standards in one of these ways, in order of preference:

1. **Vendored copy at a tag.** Add this repository as a Git submodule (or
   subtree) checked out at a published tag and link to local paths. Agents and
   skills read the files without network access.
2. **Raw URLs pinned to a tag.** Use
   `https://raw.githubusercontent.com/svazquezco/engineering-standards/<tag>/standards/<file>.md`.
   Raw URLs return Markdown; `github.com/.../blob/...` URLs return an HTML page.
3. **`main`.** Only for projects that deliberately follow unreleased changes.

Skills and tools can discover the standards and their scopes from
[standards/index.json](../standards/index.json).

For example:

<!-- x-release-please-start-version -->

```markdown
## Engineering standards

Read the relevant linked standards before working on a task:

- [Documentation](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.0.1/standards/documentation.md)
- [Python coding](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.0.1/standards/python-coding.md)
- [Python unit tests](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.0.1/standards/python-testing.md)
- [Dependencies](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.0.1/standards/dependencies.md)
```

<!-- x-release-please-end -->

The standards stay in this repository. Reference them rather than copying their
contents into each project. Keep project-specific setup, validation commands,
and exceptions in the consuming project’s documentation. Agents must open and
read the relevant links; if access fails, they must report it.

## Initial Python configuration

Follow [Start a Python project](python-projects.md) to initialize metadata with
uv, merge the Python configuration, generate a lockfile, and add the initial CI
workflow. The template includes pytest, Ruff ALL with documented exceptions and
120-character lines, strict Pyright for production code, and pre-commit hooks.

## Reference a fixed version

<!-- x-release-please-start-version -->

Templates pin every link to the same published tag, such as `v1.0.1`:

```text
https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.0.1/standards/documentation.md
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
