# Branching

Scope: Git projects.

- Start ordinary work from the repository's documented default branch, normally main.
- Use a descriptive lower-case branch, such as `feat/add-export`, `fix/token-refresh`, or `docs/setup`. An issue identifier is optional unless local policy requires it.
- Keep changes focused and preserve other contributors' work.
- Rebase your own work branch onto its base when updating it. Coordinate before rewriting a shared branch.
- After rewriting a published branch, use `git push --force-with-lease`; never use bare `--force`.

See [pull requests](pull-requests.md) and [commits](commit-messages.md).
