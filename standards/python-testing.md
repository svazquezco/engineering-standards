# Python unit tests

Scope: Python unit tests. See [general testing](testing.md) for the broader strategy.

- Use pytest functions and fixtures, rather than classes used only to group tests.
- Name files and tests with the test_ prefix. Use descriptive names instead of test docstrings. Do not add parameter or return type annotations to test functions, fixtures, or fixture factories. Do not add test-module or test-function docstrings.
- Follow Arrange, Act, Assert with blank lines between phases rather than phase comments. Keep one behavior per test; related assertions may validate one result together.
- Use parametrization for variations of the same behavior. Avoid conditional assertion logic and private helper functions in test modules; use fixtures and factories.
- Mirror the source package structure. Put shared fixtures in the narrowest appropriate conftest.py; split unrelated fixture groups as needed.
- Use factory fixtures for repeated object construction and keep fixture dependency chains to at most three levels. Split large fixture collections into focused modules loaded through `pytest_plugins` in the root conftest.py; do not declare it in nested conftest.py files.
- Do not use `SimpleNamespace`, empty stub classes, or loose attribute containers in place of typed domain values. Use real values or meaningful test doubles.
- Disable Ruff annotation requirements and function-docstring requirements in tests and fixtures; allow assertions in test code. Keep the remaining lint rules active.
- Prefer real domain objects. Mock only boundaries that cannot run in an isolated unit test. Use pytest-mock and autospec when patching interfaces.
- Do not call real APIs or databases in unit tests. For HTTP clients, intercept transport requests so request construction remains exercised.
- Pass a fixed clock value where supported, or freeze time for code that reads it directly.
- Exercise private behavior through public interfaces and cover important decision branches near their public owner.
- Set coverage expectations in the project's testing documentation and explain exclusions.
