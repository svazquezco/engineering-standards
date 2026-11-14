# Python Error Handling

Scope: Python applications and reusable packages.

## Choose and handle exceptions

- Expose documented exception types from reusable packages. Give project-specific exceptions a common base class so callers can catch them consistently.
- Use appropriate built-in exceptions, such as `ValueError` for an invalid value, when they describe the failure clearly. A project-specific exception should add a useful distinction for callers.
- Catch an exception only where the code can recover, explain the failure to its caller, or report it at the end of the operation. Otherwise, let it propagate.
- Catch the most specific exception types you can handle. Keep the `try` body limited to the operation that can raise them. Use an `else` clause when it keeps follow-up work outside the protected block.
- Avoid bare `except` clauses and catches of `BaseException`. Catch `Exception` only at an execution boundary, such as a process entry point or a request or job handler, when you can report unexpected failures and ensure the operation is treated as failed. Let shutdown and cancellation signals propagate.
- Keep exception handlers focused. Prefer context managers for resource cleanup and avoid nested `try` blocks when the operations can be handled independently.
- Do not hide a failed operation behind an empty result or success response. Use an explicit return value for expected absence when absence is a normal outcome.

## Preserve the cause

- When a dependency raises an exception that does not belong in the project’s public interface, replace it with an appropriate exception from that interface.
- Use `raise new_error from original_error` to keep the original exception and traceback available for debugging. The exception type comes from the project; no particular class name is required.
- Do not catch an exception just to raise it again. Add useful context or perform necessary recovery or cleanup when handling it.
- Suppress the original cause only for a documented reason, such as preventing sensitive implementation details from reaching a public response.

## Report once and clean up

- Log an error once, where it is finally handled. Intermediate functions should let it propagate or add context rather than logging the same failure repeatedly.
- Use `logger.exception` inside an exception handler when the traceback helps diagnose the failure. A CLI can instead print a concise error and return a non-zero exit status.
- Write errors in English. Include safe context, such as the operation name or a sanitized identifier, and exclude secrets, personal data, and raw request or response bodies.
- Close files and connections, release locks, and remove temporary resources even when an operation fails. Prefer context managers; use `try/finally` when a context manager is unavailable.
- Test the exception types callers receive, preservation of the original cause, cleanup, and intentional recovery behavior.

See [Python testing](python-testing.md) for deterministic failure tests.
