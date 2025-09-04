# Project Structure & Local Docs

- Mandatory files in the **project root** (Russian-language): `README.md`, `TODO.md`, `CHANGELOG.md`.
- Project-specific additions/overrides live here:
  - `.kilocode/rules/` (topic-scoped rules in English, one rule per file)
  - `.kilocode/rules/memory-bank/` — living project context (Russian): `brief.md`, `product.md`, `context.md`, `architecture.md`, `tech.md`, `tasks.md`
- Rule precedence: **global → project → mode**. On conflicts, **project overrides global**; **mode overrides both**.
- Evolve practices safely: pilot on a small code slice, document the decision, then reformat the codebase.
