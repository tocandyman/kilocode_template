#!/usr/bin/env bash
set -euo pipefail

if ! command -v sudo >/dev/null 2>&1; then
  echo "sudo not found. Please run as root or install sudo." >&2
  exit 1
fi

sudo apt-get update
sudo apt-get install -y zsh git curl wget build-essential   fzf ripgrep fd-find bat delta tmux direnv locales

# Locale
sudo locale-gen ru_RU.UTF-8 en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8

# oh-my-zsh (or zinit alternative)
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Plugins
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions || true
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting || true

# Starship prompt
curl -fsSL https://starship.rs/install.sh | bash -s -- -y

# .zshrc
if ! grep -q "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" "${HOME}/.zshrc" 2>/dev/null; then
  sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "${HOME}/.zshrc" || true
  echo 'eval "$(starship init zsh)"' >> "${HOME}/.zshrc"
  echo 'eval "$(direnv hook zsh)"' >> "${HOME}/.zshrc"
fi

# Set default shell
if [ "$SHELL" != "$(command -v zsh)" ]; then
  chsh -s "$(command -v zsh)" || true
fi

echo "Zsh dev environment configured."
