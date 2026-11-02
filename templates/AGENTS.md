# Project agent instructions

Keep the project’s purpose and main components in its existing documentation.

## Read first

1. README.md
2. docs/architecture.md
3. docs/contributing.md
4. docs/testing.md

## Shared standards

Read the relevant linked standards before working on a task. These links use the current standards on `main`. For a fixed documentation version, use the same published version tag or full commit SHA instead of `main` in every URL. If they cannot be accessed, report the limitation.

- [Planning](https://github.com/svazquezco/engineering-standards/blob/main/standards/planning.md)
- [Development](https://github.com/svazquezco/engineering-standards/blob/main/standards/development.md)
- [Security](https://github.com/svazquezco/engineering-standards/blob/main/standards/security.md)
- [Documentation](https://github.com/svazquezco/engineering-standards/blob/main/standards/documentation.md)
- [Branching](https://github.com/svazquezco/engineering-standards/blob/main/standards/branching.md)
- [Commits](https://github.com/svazquezco/engineering-standards/blob/main/standards/commit-messages.md)
- [Pull requests](https://github.com/svazquezco/engineering-standards/blob/main/standards/pull-requests.md)
- [Testing](https://github.com/svazquezco/engineering-standards/blob/main/standards/testing.md)

For Python projects, also adopt:

- [Python](https://github.com/svazquezco/engineering-standards/blob/main/standards/python-coding.md)
- [Python tests](https://github.com/svazquezco/engineering-standards/blob/main/standards/python-testing.md)
- [Dependencies](https://github.com/svazquezco/engineering-standards/blob/main/standards/dependencies.md)
- [Error handling](https://github.com/svazquezco/engineering-standards/blob/main/standards/error-handling.md)

Also reference [CLI](https://github.com/svazquezco/engineering-standards/blob/main/standards/cli.md) when applicable.

## Before publishing or updating a PR

For Python projects using this configuration, run `uv run --locked --all-groups pre-commit run --all-files` (or `make pre-commit`) and the project’s tests. Fix failures and report the results before publishing or updating the PR.

## Local commands and exceptions

Keep links to the project’s exact setup and validation commands here. Remove inapplicable standards. Record exceptions with the affected standard, local replacement, and reason. Explicit task instructions and documented local rules take precedence over shared defaults; call out conflicts.
