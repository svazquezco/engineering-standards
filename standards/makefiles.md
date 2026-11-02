# Makefiles

Scope: projects that choose Make as their command entry point. Make is not required for every repository.

- Keep a discoverable `make help` target describing supported commands.
- Expose stable names for common workflows such as check, test, and format when relevant. Document their actual behavior in the project.
- Keep a small project in one Makefile. Split large command groups into make/*.mk only when that improves navigation.
- If local overrides are supported, use an ignored make/local.mk file and document how it is included.
- Keep commands reproducible in documented environments and propagate failures through Make.
- Include only commands and tooling relevant to the project’s documented workflows.
