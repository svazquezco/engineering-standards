# Branching

Scope: Git projects.

- Start ordinary work from the repository's documented default branch, normally
  main.
- Use a descriptive lower-case branch, such as `feat/add-export`,
  `fix/token-refresh`, or `docs/setup`. An issue identifier is optional unless
  local policy requires it.
- Keep changes focused and preserve other contributors' work.
- Rebase your own work branch onto its base when updating it. Coordinate before
  rewriting a shared branch.
- Before rewriting an owned published branch, capture its remote head and use
  `git push --force-with-lease=refs/heads/<branch>:<captured-sha>`; never use
  bare `--force`.
- Backports target an explicitly supported maintenance branch, with their own
  verification. Confirm the base rather than inventing a release branch, and
  document whether the fix must also reach the default branch.

See [pull requests](pull-requests.md) and [commits](commit-messages.md).
