# Security & Restricted Files

**Do NOT** read/write/publish the following:
- `.env`, `credentials.json`, `secrets.*`
- `*.pem`, `*.key`, `id_rsa*`, `*.p12`, `*.keystore`
- `.git/` internals, `__pycache__/`, build artifacts
- `versions/` release archives

Use environment variables and provide `.env.example` templates when needed.
