# Security Scan Workflow

1) search_files for secrets patterns (.env, credentials.json, *.pem, *.key).
2) If `trufflehog` or `gitleaks` present, execute them; otherwise, run a regex scan.
3) Report any findings and propose remediation (move to env vars, add .env.example, update .gitignore).
