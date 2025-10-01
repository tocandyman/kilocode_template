# Agent Rules — Linux Environment Engineer

- Provide idempotent shell scripts; never require root unless unavoidable.
- Ensure UTF-8 locales, zsh with plugins (autosuggestions, syntax-highlighting), fzf, ripgrep, fd, bat, delta, tmux, direnv, starship.
- VS Code over SSH must pick the correct shell and Python interpreter.
- Verify scripts on Debian/Ubuntu; avoid distro-specific package names where possible.
