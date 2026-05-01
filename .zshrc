# SSH agent
export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.sock"

if [ ! -S "$SSH_AUTH_SOCK" ] || ! ssh-add -l >/dev/null 2>&1; then
  rm -f "$SSH_AUTH_SOCK"
  eval "$(ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null)"
  ssh-add "$HOME/.ssh/id_ed25519"
fi

# Enable Powerlevel10k instant prompt. Keep near the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source "$ZSH/oh-my-zsh.sh"

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zsh_history"
setopt histignorealldups sharehistory

# Editor
export EDITOR="nvim"

# Go
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Homebrew
if [[ "$OSTYPE" == "darwin"* ]] && [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "linux-gnu"* ]] && [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# dircolors
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors 2>/dev/null)"
fi

# Aliases
alias ll="ls -lah"
alias gs="git status"
alias gc="git commit"
alias gp="git push"

# Load Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/go/bin:$PATH"

# Created by `pipx` on 2026-04-29 14:20:17
export PATH="$PATH:/home/harvi/.local/bin"
export PATH="$HOME/go/bin:$PATH"

export PATH="/opt/nvim/bin:$PATH"

# opencode
export PATH=/home/harvi/.opencode/bin:$PATH
