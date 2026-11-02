# Python dependencies

Scope: Python applications, tools, and libraries.

- Use pyproject.toml for direct dependencies and uv for environment and lock management.
- Update uv.lock whenever dependency declarations change. Commit the lockfile for repository development and CI reproducibility.
- For applications, prefer patch-level ranges such as `httpx==0.28.*` when minor upgrades need explicit review. Exact pins require a compatibility or reproducibility reason.
- For reusable libraries, declare the supported compatible range so consumers can resolve their own environments. Validate the claimed supported versions rather than assuming compatibility.
- Distinguish runtime, development, and optional dependencies. Avoid adding a dependency for a trivial operation the standard library handles clearly.
- Review dependency and lockfile changes together. Run relevant checks after upgrades and document incompatible migrations.

Version numbers in examples illustrate range syntax; they are not current-version recommendations.
