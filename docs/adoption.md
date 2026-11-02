# Adopt these standards

## Choose a revision

After hosting this repository, choose its owner, repository name, and a full commit SHA. A published version tag can also be used, but a full SHA protects references from moved tags. No version tag has been published as part of this initial scaffold.

Use this URL pattern, replacing all placeholders:

```text
https://github.com/OWNER/REPOSITORY/blob/REVISION/standards/documentation.md
```

Use the same revision for every standard in a consuming project. Do not use `main` for a reproducible policy baseline.

## Add project guidance

Copy templates/AGENTS.md into the consuming project, adapting it to existing instructions rather than overwriting them. Replace OWNER, REPOSITORY, REVISION, the project overview, and every command placeholder. Adopt the core documents first; include Python policy only for Python projects. Link to the shared rules instead of copying them.

Document exact setup and validation commands in the project's docs/testing.md and docs/contributing.md. A link does not install tools, configure a linter, or guarantee that an agent reads the content. Agents must fetch and read the referenced rules; if access is unavailable, report that limitation rather than claiming compliance. For offline use, maintain a local copy with its upstream SHA and license notices, and review updates explicitly.

## Precedence and exceptions

Explicit task instructions take precedence over these shared defaults. A consuming repository's documented local rules override the shared defaults. Record each exception in its AGENTS.md or docs/contributing.md with the affected standard, replacement rule, and reason. Report conflicts when applying a standard rather than silently combining incompatible requirements.

## Update

Review the standards diff between the current and proposed revisions, evaluate changed requirements against the project, update all references together, and run its validation commands. Submit that adoption change for review. See versioning.md for compatibility expectations.
