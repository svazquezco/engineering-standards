# Versioning

The repository is released as one documentation set using `vMAJOR.MINOR.PATCH` tags. [VERSION](../VERSION), [.release-please-manifest.json](../.release-please-manifest.json), and [CHANGELOG.md](../CHANGELOG.md) are maintained by release automation. Before the first release, the empty manifest uses the initial version defined in [release-please-config.json](../release-please-config.json).

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
2. Open or update a release PR containing the proposed VERSION, release manifest, and generated dated changelog entry.
3. Publish the corresponding version tag and GitHub release after the release PR is reviewed, passes validation, and is merged with authorization.

Do not add speculative version entries to CHANGELOG.md during normal development. The release PR contains the generated notes for review. Never move or overwrite a published tag; corrections use a new version and commit. Stop amending the initial commit after the first version is published.

## Activation after the initial review

The workflow is prepared with `RELEASE_AUTOMATION_ENABLED` unset. This prevents publication while the initial commit is being reviewed and amended. Once review is complete and release automation is authorized:

1. In repository Settings → Actions → General, allow GitHub Actions to create pull requests. The workflow uses the repository’s GITHUB_TOKEN with only the permissions declared in its release job.
2. Set the repository Actions variable `RELEASE_AUTOMATION_ENABLED` to `true`.
3. Run the Documentation release workflow from `main`, or push the next reviewed change. Review the generated release PR before authorizing its merge.

The default token does not trigger other workflows for PRs it creates. The release workflow waits for its reusable validation job, which runs the repository’s pre-commit checks through Make, before generating or publishing a release; run the same required checks on the generated release PR before merging it. For automatic PR-triggered validation, configure a dedicated GitHub App or scoped token separately rather than silently widening credentials.

The workflow requires no manual version arithmetic or changelog entry writing. It never merges a PR automatically. Merely preparing the configuration does not create a version tag or release.

## Reference and upgrade

After a version is published, projects can reference its fixed documentation snapshot:

```text
https://github.com/svazquezco/engineering-standards/blob/v1.0.0/standards/python-coding.md
```

Use the same published tag for every standard in a consuming project. A full commit SHA also provides a fixed snapshot; `main` follows current changes. To upgrade, review the diff and migration notes, update all links together, and run the consuming project’s checks.

See the [Release Please action](https://github.com/googleapis/release-please-action) and [manifest configuration](https://github.com/googleapis/release-please/blob/main/docs/manifest-releaser.md) for the automation’s contracts.
