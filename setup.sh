#!/usr/bin/env bash

set -e

echo "🚀 Setting up dotfiles..."

DOTFILES_DIR="$HOME/.dotfiles"

# --- Helper: create symlink safely ---
link() {
  local src="$DOTFILES_DIR/$1"
  local dest="$2"

  if [ -L "$dest" ]; then
    echo "🔁 Updating symlink: $dest"
    ln -sf "$src" "$dest"
  elif [ -f "$dest" ]; then
    echo "📦 Backing up existing file: $dest -> $dest.backup"
    mv "$dest" "$dest.backup"
    ln -s "$src" "$dest"
  else
    echo "🔗 Linking $dest"
    ln -s "$src" "$dest"
  fi
}

# --- ZSH ---
link ".zshrc" "$HOME/.zshrc"

# --- Powerlevel10k ---
link ".p10k.zsh" "$HOME/.p10k.zsh"

# --- Git ---
link ".gitconfig" "$HOME/.gitconfig"

# --- Ensure Oh My Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "📦 Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh My Zsh already installed"
fi

# --- Install plugins ---
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

install_plugin() {
  local repo="$1"
  local dir="$2"

  if [ ! -d "$ZSH_CUSTOM/plugins/$dir" ]; then
    echo "📦 Installing $dir..."
    git clone "$repo" "$ZSH_CUSTOM/plugins/$dir"
  else
    echo "✅ $dir already installed"
  fi
}

install_plugin https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions
install_plugin https://github.com/zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting

# --- Powerlevel10k theme ---
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "📦 Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "✅ Powerlevel10k already installed"
fi

# --- Node (NVM) ---
if [ ! -d "$HOME/.nvm" ]; then
  echo "📦 Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
  echo "✅ NVM already installed"
fi

# --- Final message ---
echo ""
echo "🎉 Setup complete!"
echo "👉 Restart your terminal or run: source ~/.zshrc"
