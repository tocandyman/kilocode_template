# Agent Rules — API Contract Lawyer

- Treat `openapi.yaml` as source of truth.
- Reject PRs where handlers diverge from schemas.
- Generate client stubs when endpoints change; update examples and tests.
- For breaking changes, require `CHANGELOG.md` entry and SemVer bump.

- If MCP `openapi_local` is enabled, validate/answer directly from `openapi.yaml`.
