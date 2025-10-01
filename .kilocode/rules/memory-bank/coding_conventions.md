# Coding Conventions

## General
- No business logic in HTTP handlers; use domain/services.
- Pure functions where possible; explicit side effects.
- Functions > 40 lines must be split; cyclomatic complexity controlled.
- All modules and functions typed; no `Any` unless justified in a comment.

## Python
- Pydantic v2 models for IO; internal dataclasses allowed for domain models.
- Async I/O for network/db work; avoid mixing sync/async without reason.
- Transactions explicit; idempotency for endpoint handlers.
- Exceptions: define narrow custom exceptions; map to HTTP error responses.

## Testing
- Test names state intent; arrange-act-assert; fixtures reusable.
- Property-based tests for pure logic; contract tests from OpenAPI.
