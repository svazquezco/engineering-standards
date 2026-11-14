# Project agent instructions

Keep the project’s purpose and main components in its existing documentation.

## Read first

1. README.md
2. docs/architecture.md
3. docs/contributing.md
4. docs/testing.md

## Shared standards

<!-- x-release-please-start-version -->
Read the relevant linked standards before working on a task. The links are pinned to the published tag `v1.1.0`; to upgrade, replace that tag in every URL together. If the project vendors the standards (for example as a Git submodule), use the local paths instead. If they cannot be accessed, report the limitation.

- [Planning](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/planning.md)
- [Development](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/development.md)
- [Security](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/security.md)
- [Documentation](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/documentation.md)
- [Branching](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/branching.md)
- [Commits](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/commit-messages.md)
- [Pull requests](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/pull-requests.md)
- [Testing](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/testing.md)

For Python projects, also adopt:

- [Python](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/python-coding.md)
- [Python tests](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/python-testing.md)
- [Dependencies](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/dependencies.md)
- [Error handling](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/error-handling.md)

Also reference [CLI](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.1.0/standards/cli.md) and [Makefiles](https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.0.1/standards/makefiles.md) when applicable.
<!-- x-release-please-end -->

## Before publishing or updating a PR

For Python projects using this configuration, run `make check`, which runs all pre-commit hooks against all files and the tests. Fix failures and report the results before publishing or updating the PR.

## Local commands and exceptions

Keep links to the project’s exact setup and validation commands here. Remove inapplicable standards. Record exceptions with the affected standard, local replacement, and reason. Explicit task instructions and documented local rules take precedence over shared defaults; call out conflicts.
