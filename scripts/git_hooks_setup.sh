#!/usr/bin/env bash
set -euo pipefail
if ! command -v pre-commit >/dev/null 2>&1; then
  echo "pre-commit not installed. Run: make install" >&2
  exit 1
fi
pre-commit install -t pre-commit -t commit-msg
echo "Git hooks installed (pre-commit & commit-msg)."
