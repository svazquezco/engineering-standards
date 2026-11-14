# Pull requests

Scope: changes submitted for review.

- Use a concise Conventional Commit style title describing the final outcome.
  Link relevant issues in the description when available; do not require a
  particular tracker.
- Explain the problem, resulting behavior, validation performed, and material
  limitations. Include migration steps for incompatible changes.
- Prepare the complete description before creating a ready PR. Use a draft when
  required context or validation is still missing.
- Each PR must deliver one independently reviewable outcome and contain exactly
  one change commit relative to its base. Put unrelated changes in separate PRs.
  If repository policy requires separate commits, document that requirement in
  the PR description.
- Keep your branch history linear and follow [branching](branching.md) when
  updating it.
- Before publishing or updating a PR, agents must run the project’s configured
  pre-commit hooks against all files, fix failures, and report the command and
  result. Use the project’s documented command or Make target. If no pre-commit
  configuration exists, report that limitation and run the project’s documented
  checks.
- Report required checks accurately. Do not weaken validation to make a change
  pass.
- Address actionable review findings and explain the evidence for declined
  suggestions.
- Review AI-assisted changes with the same care as other contributions; disclose
  material unverified assumptions.
