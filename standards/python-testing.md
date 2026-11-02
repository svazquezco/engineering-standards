# Python unit tests

Scope: Python unit tests. See [general testing](testing.md) for the broader strategy.

- Use pytest functions and fixtures, rather than classes used only to group tests.
- Name files and tests with the test_ prefix. Use descriptive names instead of test docstrings. Type annotations in test functions are optional unless local tooling requires them.
- Follow Arrange, Act, Assert. Keep one behavior per test; related assertions may validate one result together.
- Use parametrization for variations of the same behavior. Avoid conditional assertion logic.
- Mirror the source package structure. Put shared fixtures in the narrowest appropriate conftest.py; split unrelated fixture groups as needed.
- Use factory fixtures for repeated object construction and keep dependency chains shallow.
- Prefer real domain objects. Mock only boundaries that cannot run in an isolated unit test. Use pytest-mock and autospec when patching interfaces.
- Do not call real APIs or databases in unit tests. For HTTP clients, intercept transport requests so request construction remains exercised.
- Pass a fixed clock value where supported, or freeze time for code that reads it directly.
- Exercise private behavior through public interfaces and cover important decision branches near their public owner.
- Set coverage expectations in the project's testing documentation and explain exclusions.
