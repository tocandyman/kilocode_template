# Global AI Rules (KiloCode)

1. Truth Sources: OpenAPI spec, ADRs, schema migrations, and tests outrank prose.
2. No temporary solutions. If truly temporary, ship with ticket ID and removal date.
3. All claims must be verifiable via artifacts in `artifacts/` (reports, logs, SBOM).
4. English for code/comments/docs; user-facing UI text localizable.
5. Secrets never stored in repo; only via env/secret managers.
6. Break contract only with a SemVer major + migration notes.

7. Documentation and all user-facing text must **support Russian by default**; encoding is UTF-8 across repo, APIs, DB, and CI.

8. MCP servers must follow least-privilege: read-only by default, narrow scopes, and documented in Memory Bank upon changes.
