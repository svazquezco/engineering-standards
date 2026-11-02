# Contributing

Use a focused branch and pull request following [branching](../standards/branching.md), [commits](../standards/commit-messages.md), and [pull requests](../standards/pull-requests.md).

Each standard must state its scope and use explicit requirements. Explain when a technology-specific rule applies. Keep examples generic and valid. Document changes to existing requirements in the PR, including migration impact and the intended version category from [versioning](versioning.md).

Use Conventional Commits so the release workflow can calculate versions and generate CHANGELOG.md entries. Do not update VERSION or add changelog entries during ordinary development; review the generated release PR as described in [versioning](versioning.md).

Before handoff, run `make check` and `git diff --check`. Before publishing or updating a PR, also run pre-commit against all files as documented in [testing](testing.md), fix failures, and report the outcome. Review the rendered Markdown, verify template links point to the shared standards, and check that every standard is indexed in README.md. Runtime tests and coverage thresholds do not apply to this documentation repository.

Preserve LICENSE and any required source attribution. Newly adapted material must include its provenance and any required notices.
