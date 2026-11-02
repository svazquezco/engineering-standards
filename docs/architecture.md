# Architecture

This repository is the shared source of engineering standards referenced by other projects.

- `standards/` contains reusable rules, organized by topic and technology.
- `templates/python/` contains initial Python tool settings, interpreter selection, Make and Compose entry points, and a consumer CI example.
- `templates/AGENTS.md` provides ready-to-copy links for a consuming project’s agent instructions.
- `VERSION` and `CHANGELOG.md` track versions and generated release notes; published Git tags identify fixed snapshots.
- `release-please-config.json` and `.release-please-manifest.json` configure automated version proposals and publication.
- `Makefile` provides local and CI validation entry points; releases reuse the same pre-commit validation workflow.
- `docs/` explains how to reference and maintain the standards.

Keep shared rules in `standards/`. Each consuming project documents its own architecture, commands, and exceptions locally and references the shared rules by URL.
