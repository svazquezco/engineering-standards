# Branching

Scope: Git projects.

- Start ordinary work from the repository's documented default branch, normally
  main.
- Every new branch for a change must use `<type>/<slug>`. Choose the type
  according to the primary purpose of the change. Allowed types are `feat`,
  `fix`, `docs`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, and
  `revert`. Use lowercase letters, digits, and hyphens in the descriptive slug.
  Examples include `feat/add-export`, `fix/token-refresh`, and `docs/setup`. An
  issue identifier is optional unless local policy requires it.
- This naming rule applies to branches created by people and automation.
  Automated tools must override their default prefix if it differs from the
  required type. Prefixes based on tool names are prohibited.
- Existing branches may keep their names. A project that needs a different
  convention for a specific workflow must document that exception locally.
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
