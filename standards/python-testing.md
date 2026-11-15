# Python unit tests

Scope: Python unit tests. See [general testing](testing.md) for the broader
strategy.

- Use pytest functions and fixtures, rather than classes used only to group
  tests.
- Name files and tests with the test_ prefix. Use descriptive names instead of
  test docstrings. Do not add parameter or return type annotations to test
  functions, fixtures, or fixture factories. Do not add test-module or
  test-function docstrings.
- Follow Arrange, Act, Assert with blank lines between phases rather than phase
  comments. Keep one behavior per test; related assertions may validate one
  result together.
- Use parametrization for variations of the same behavior. Avoid conditional
  assertion logic and private helper functions in test modules; use fixtures and
  factories.
- Mirror the source package structure. Define a fixture in its test module if
  only that module uses it. Share fixtures through the closest common
  `conftest.py` of the tests that use them. For example, put fixtures shared by
  billing tests in `tests/billing/conftest.py`. Use the suite's top-level
  `conftest.py` for fixtures shared across the suite.
- Use factory fixtures for repeated object construction and keep fixture
  dependency chains to at most three levels.
- Use `pytest_plugins` only when you need to load a fixture module as a plugin
  for the entire suite. Examples include a reusable fixture library that needs
  explicit registration or a complex test suite with shared fixture modules
  that need separate registration. Declare `pytest_plugins` only in the
  suite's top-level `conftest.py`.
- Do not use `SimpleNamespace`, empty stub classes, or loose attribute
  containers in place of typed domain values. Use real values or meaningful test
  doubles.
- Disable Ruff annotation requirements and function-docstring requirements in
  tests and fixtures; allow assertions in test code. Keep the remaining lint
  rules active.
- Prefer real domain objects. Mock only boundaries that cannot run in an
  isolated unit test. Use pytest-mock and autospec when patching interfaces.
- Do not call real APIs or databases in unit tests. For HTTP clients, intercept
  transport requests so request construction remains exercised.
- Pass a fixed clock value where supported, or freeze time for code that reads
  it directly.
- Exercise private behavior through public interfaces and cover important
  decision branches near their public owner.
- Set coverage expectations in the project's testing documentation and explain
  exclusions.
