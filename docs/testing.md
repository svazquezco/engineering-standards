# Validation

Requires Git, Make, and uv. CI uses Python 3.14. Run the same checks locally and in CI:

```sh
make check
git diff --check
```

`make check` runs the remote, versioned hooks in [.pre-commit-config.yaml](../.pre-commit-config.yaml): file hygiene, merge conflicts, JSON/TOML/YAML syntax, and that `standards/index.json` and README.md list every standard. Ruff and Pyright hooks run when matching files are present; [pyproject.toml](../pyproject.toml) contains their configuration.

Review Markdown rendering, links, policy correctness, and release metadata manually. VERSION, the release manifest, and changelog entries are maintained by Release Please.

Use `make pre-commit` before publishing or updating a PR. Without Make, run:

```sh
uv tool run --from 'pre-commit==4.7.*' pre-commit run --all-files
```

GitHub Actions runs the same hooks on pushes and pull requests. The release workflow reuses that validation before generating or publishing a version. Docker and application tests belong to consuming projects when applicable.
