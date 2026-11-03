# Engineering standards

Personal engineering standards for applications, tools, and libraries. This repository is the shared source of policy: other projects reference these documents from their AGENTS.md instead of copying the rules.

## Standards

| Standard | Applies to |
| --- | --- |
| [Planning](standards/planning.md) | Engineering change planning |
| [Development](standards/development.md) | Implementation and handoff |
| [Security](standards/security.md) | Repositories, tooling, and data |
| [CLI](standards/cli.md) | Command-line tools |
| [Documentation](standards/documentation.md) | All repositories |
| [Branching](standards/branching.md) | Git workflows |
| [Commit messages](standards/commit-messages.md) | Git commits |
| [Pull requests](standards/pull-requests.md) | Reviewed changes |
| [Testing](standards/testing.md) | Executable projects |
| [Python coding](standards/python-coding.md) | Python source code |
| [Python unit tests](standards/python-testing.md) | Python unit tests |
| [Dependencies](standards/dependencies.md) | Python dependency management |
| [Error handling](standards/error-handling.md) | Python exception contracts |
| [Makefiles](standards/makefiles.md) | Projects using Make |

## Adopt

Add the links from [templates/AGENTS.md](templates/AGENTS.md) to your project’s AGENTS.md and copy [templates/CLAUDE.md](templates/CLAUDE.md). The links are pinned to a published tag; keep the ones relevant to your project. [standards/index.json](standards/index.json) lists every standard for skills and tools. See [adoption](docs/adoption.md) for vendoring and upgrade options.

For new Python projects, follow [initial setup](docs/python-projects.md) for uv, pytest, Ruff, Pyright, pre-commit, and CI.

## Versions

The documentation set uses `vMAJOR.MINOR.PATCH` Git tags. To reference a fixed version, use its published tag in place of `main` in every standards URL. Release automation maintains [VERSION](VERSION) and generates [CHANGELOG.md](CHANGELOG.md) from Conventional Commits in a release PR. See [versioning](docs/versioning.md) for publication and upgrades.

## Maintain

- [Architecture](docs/architecture.md)
- [Contributing](docs/contributing.md)
- [Validation](docs/testing.md)
- [Versioning](docs/versioning.md)

License: [Apache 2.0](LICENSE).
