# MCP Servers

Current enabled servers (`.kilocode/mcp.json`):
- `context7` — context window tools (Upstash Context7)
- `filesystem` — read-only filesystem under `/opt/*`
- `time` — reliable time source

Optional servers (`.kilocode/mcp.optional.json`):
- `http_fetch` — lightweight HTTP client (GET/HEAD)
- `clipboard` — clipboard (prefer read-only)
- `git` — read-only repo insights
- `openapi_local` — contract-aware queries from `openapi.yaml`
- `docker` — container introspection

## Security & Least Privilege
- Prefer **read-only** everywhere; expand scope per task.
- Restrict filesystem roots; avoid `/` globs.
- Document enabled tools in Memory Bank `architecture.md` and `context.md` when changing.
