# Python dependencies

Scope: Python applications, tools, and libraries.

- Use pyproject.toml for direct dependencies and uv for environment and lock
  management.
- Declare directly imported third-party packages as direct dependencies in the
  correct group; do not rely on transitive dependencies.
- Generate and update lockfiles with uv, not by hand. Use `uv sync --locked` and
  `uv run --locked` in CI so declarations and the committed lockfile must agree.
- Update uv.lock whenever dependency declarations change. Commit the lockfile
  for repository development and CI reproducibility.
- For reusable libraries and packages consumed by other projects, runtime
  dependencies must specify an inclusive minimum supported version and an
  exclusive upper bound, such as `example>=2.3.0,<3.0.0`. Allow all versions
  within that supported range; do not use `==A.B.*` for these runtime
  dependencies. Validate the minimum and latest supported versions.
- For applications, tools, and other projects, direct dependencies must use
  `==A.B.*`, such as `example==2.3.*`, allowing patch updates within the
  selected minor version. Use the same form for development dependencies in
  reusable libraries and packages.
- New-project scaffolds may declare development and application runtime
  dependencies without a fixed minor series to resolve the latest compatible
  stable releases at creation. Commit the generated lockfile and use locked
  installation and execution. The runtime bounds for reusable libraries still
  apply.
- Distinguish runtime, development, and optional dependencies. Avoid adding a
  dependency for a trivial operation the standard library handles clearly.
- Review dependency and lockfile changes together. Run relevant checks after
  upgrades and document incompatible migrations.

Version numbers in examples illustrate range syntax; they are not
current-version recommendations.
