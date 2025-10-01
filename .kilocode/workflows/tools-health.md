# tools-health.md — Verify MCP Tools Health

## Steps
1) read_file(): `.kilocode/mcp.json` and list enabled servers.
2) For each server:
   - execute_command(): run a minimal health action (e.g., `time.now`, list directory via filesystem).
3) Summarize availability and permissions (read-only vs write).
4) Update `.kilocode/rules/memory-bank/context.md` with a short note like: "MCP: filesystem, time, context7 — OK".
