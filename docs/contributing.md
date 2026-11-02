# Contributing

Use a focused branch and pull request following [branching](../standards/branching.md), [commits](../standards/commit-messages.md), and [pull requests](../standards/pull-requests.md).

Each standard must state its scope and use explicit requirements. Explain when a technology-specific rule applies. Keep examples generic and valid. Document changes to existing requirements in the PR, including migration impact and the intended version category from [versioning](versioning.md).

Before handoff, run `python3 scripts/check_docs.py` and `git diff --check`. Review the rendered Markdown, verify template placeholders are documented, and check that every standard is indexed in README.md. Runtime tests and coverage thresholds do not apply to this documentation repository.

Preserve LICENSE, including source attribution. Newly adapted material must include its provenance and any required notices.
