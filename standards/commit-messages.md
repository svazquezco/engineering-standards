# Commit messages

Scope: Git commits.

Use Conventional Commits: `type(optional-scope): short summary`. Common types include feat, fix, docs, refactor, test, build, ci, and chore. Write the summary in English and describe the result clearly.

Include a body explaining what changed and why. Link an issue when one exists; an issue tracker is not required. Mark an incompatible public change with `!` and explain its migration in a `BREAKING CHANGE:` footer.

```text
docs(adoption): document pinned standard references

Explain how projects select a fixed revision so policy changes are
reviewed explicitly during upgrades.
```

Keep each commit coherent and avoid mixing unrelated changes.
