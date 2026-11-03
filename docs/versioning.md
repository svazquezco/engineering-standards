# Versioning

The repository is released as one documentation set using `vMAJOR.MINOR.PATCH` tags. [VERSION](../VERSION), [.release-please-manifest.json](../.release-please-manifest.json), and [CHANGELOG.md](../CHANGELOG.md) are maintained by release automation.

## Conventional Commits

The workflow calculates the largest applicable bump from commits since the previous release:

| Commit | Version change | Policy meaning |
| --- | --- | --- |
| Any type with `!` or a `BREAKING CHANGE:` footer | Major | Strengthened mandatory rules, removed standards, or incompatible precedence |
| `feat:` | Minor | New opt-in standards or compatible recommendations |
| `fix:`, `docs:`, `refactor:`, `perf:`, `test:`, `build:`, `ci:`, `chore:`, `revert:` | Patch | Corrections, clarifications, and maintenance without incompatible policy changes |

The initial release is `1.0.0`. Describe consumer migrations in breaking commits and their PRs. Do not label an incompatible policy change as a plain documentation clarification. Version numbers cover the complete documentation set.

## Automated release flow

[release.yml](../.github/workflows/release.yml) uses Release Please to:

1. Read Conventional Commits on `main`.
2. Open or update a release PR containing the proposed VERSION, release manifest, generated dated changelog entry, and the pinned tag in the template and documentation links (the `x-release-please-start-version` blocks).
3. Publish the corresponding version tag and GitHub release after the release PR is reviewed, passes validation, and is merged with authorization.

Do not add speculative version entries to CHANGELOG.md during normal development. The release PR contains the generated notes for review. Never move or overwrite a published tag; corrections use a new version and commit.

## Release automation settings

Release automation runs when the repository Actions variable `RELEASE_AUTOMATION_ENABLED` is `true` and GitHub Actions may create pull requests (Settings → Actions → General). The workflow uses the repository’s GITHUB_TOKEN with only the permissions declared in its release job. Unset the variable to pause releases.

The default token does not trigger other workflows for PRs it creates. The release workflow waits for its reusable validation job, which runs the repository’s pre-commit checks through Make, before generating or publishing a release; run the same required checks on the generated release PR before merging it. For automatic PR-triggered validation, configure a dedicated GitHub App or scoped token separately rather than silently widening credentials.

The workflow requires no manual version arithmetic or changelog entry writing. It never merges a PR automatically. Merely preparing the configuration does not create a version tag or release.

## Reference and upgrade

After a version is published, projects can reference its fixed documentation snapshot:

<!-- x-release-please-start-version -->
```text
https://raw.githubusercontent.com/svazquezco/engineering-standards/v1.0.1/standards/python-coding.md
```
<!-- x-release-please-end -->

Use the same published tag for every standard in a consuming project. A full commit SHA also provides a fixed snapshot; `main` follows current changes. To upgrade, review the diff and migration notes, update all links together, and run the consuming project’s checks.

See the [Release Please action](https://github.com/googleapis/release-please-action) and [manifest configuration](https://github.com/googleapis/release-please/blob/main/docs/manifest-releaser.md) for the automation’s contracts.
