# Makefiles

Scope: projects that choose Make as their command entry point. Make is not
required for every repository.

- Put each public target’s English description in a `##` comment on its target
  line. Generate `make help` from those comments across all files in
  `$(MAKEFILE_LIST)` and pipe the formatted entries through `sort -u` so
  repeated includes produce a single entry per identical help line.
- Expose stable names for common workflows such as check, test, and format when
  relevant. Document their actual behavior in the project.
- Organize targets by responsibility in `make/*.mk` files in every project,
  including small ones. Use `make/common.mk` for shared definitions,
  `make/external_tools.mk` for external tooling, and `make/repo.mk` for
  repository-specific workflows.
- The root `Makefile` must contain at most 20 physical lines, including comments
  and blank lines. Limit it to variable definitions (including
  `.DEFAULT_GOAL := help`), includes, and the `help` target with its `.PHONY`
  declaration.
- Reserve `make/local.mk` for personal overrides and commands. Add it to
  `.gitignore` and load it with `-include make/local.mk` so it can be absent.
- Make targets for code analysis and application execution must run those
  commands in isolated Docker Compose containers. If a supported environment
  cannot run Compose or a command must access a host-only resource, document the
  affected targets, the reason, and the supported execution command in the
  project's local documentation.
- Keep commands reproducible in documented environments and propagate failures
  through Make.
- Include only commands and tooling relevant to the project’s documented
  workflows.
- Mark non-file targets as `.PHONY` and preserve command failures. CI steps must
  call the same Make targets as local validation and have descriptive English
  names.
- Make installation, deletion, and publication explicit; do not hide them behind
  validation targets.
- Document shell and platform requirements and supported alternatives where Make
  is unavailable.
