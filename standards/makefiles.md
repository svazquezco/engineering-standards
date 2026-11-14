# Makefiles

Scope: projects that choose Make as their command entry point. Make is not
required for every repository.

- Put each command’s English description in a `##` comment on its target line
  and generate `make help` from those comments, keeping help beside the command
  definition.
- Expose stable names for common workflows such as check, test, and format when
  relevant. Document their actual behavior in the project.
- Keep a small project in one Makefile. Split large command groups into
  make/*.mk only when that improves navigation.
- If local overrides are supported, use an ignored make/local.mk file and
  document how it is included.
- Keep commands reproducible in documented environments and propagate failures
  through Make.
- Include only commands and tooling relevant to the project’s documented
  workflows.
- Mark non-file targets as `.PHONY` and preserve command failures. CI steps must
  call the same Make targets as local validation and have descriptive English
  names. Put container execution behind those targets when the project requires
  a container environment.
- Make installation, deletion, and publication explicit; do not hide them behind
  validation targets.
- Document shell and platform requirements and supported alternatives where Make
  is unavailable.
