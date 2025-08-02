# ~/.zshrc — Clean and Apple Silicon Ready (M2 Pro)


export TERM="xterm-256color"

# Homebrew (M2 default)
if [[ -d /opt/homebrew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ASDF (via Homebrew)
if [[ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]]; then
  source "$(brew --prefix asdf)/libexec/asdf.sh"
fi

# Python virtualenv
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/projects"

mkenv() { virtualenv -p $(asdf where python "$1")/bin/python "$WORKON_HOME/$2"; }
workon() { source "$WORKON_HOME/$1/bin/activate" && cd "$PROJECT_HOME/$1" 2>/dev/null }

# Editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Locale & shell history
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Man pages
export MANPAGER="less -X"

# Extra PATHs
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH="$PATH:$HOME/development/flutter/bin/cache/dart-sdk/bin"
export PATH="/usr/local/heroku/bin:$PATH"

# Brew + grep
export GREP_OPTIONS="--color=auto"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Aliases
alias vim='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='cd ~/Documents/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias p='cd ~/projects'
alias h='history'
alias t='tree -L 2'
alias l='ls -lF'
alias la='ls -laF'
alias lsd='ls -lF | grep "^d"'
alias ls='command ls -ltch'
alias gs='git status'
alias gcl='git clone'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gk='gitk --all&'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias b='bundle'
alias sudo='sudo '
alias update='softwareupdate -i -a; brew update; brew upgrade; brew cleanup'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias exa='exa --long --header --git'
alias mp3c='for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -ab 320k "${f%.m4a}.mp3"; done'

# Functions
mkd() { mkdir -p "$@" && cd "$@"; }
fs() {
  local arg
  if du -b /dev/null &>/dev/null; then arg=-sbh; else arg=-sh; fi
  [[ -n "$@" ]] && du $arg -- "$@" || du $arg .[^.]* *
}
codepoint() {
  perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
  [[ -t 1 ]] && echo
}
getcertnames() {
  [[ -z "$1" ]] && echo "Usage: getcertnames <domain>" && return 1
  local tmp certText
  tmp=$(echo -e "GET / HTTP/1.0\nEOT" | openssl s_client -connect "$1:443" 2>&1)
  if [[ "$tmp" == *"-----BEGIN CERTIFICATE-----"* ]]; then
    certText=$(echo "$tmp" | openssl x509 -text)
    echo "Common Name:"; echo
    echo "$certText" | grep "Subject:" | sed -e "s/^.*CN=//"
    echo; echo "Subject Alternative Name(s):"; echo
    echo "$certText" | grep -A 1 "Subject Alternative Name:" | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2
  else
    echo "ERROR: Certificate not found."
    return 1
  fi
}
shp2pgis() { shp2pgsql -I -s $1 $2 $3 | psql -p 5432 -d $4; }

# Create a complete starter project structure + README
create_project() {
  local name="$1"
  local target_dir="$PROJECT_HOME/$name"
  local readme_file="$target_dir/README.md"

  if [[ -z "$name" ]]; then
    echo "Usage: create_project <project-name>"
    return 1
  fi

  if [[ -d "$target_dir" ]]; then
    echo "❌ Project '$name' already exists at $target_dir"
    return 1
  fi

  mkdir -p "$target_dir"/{src,data,docs,tests}

  # Create README.md with sections
  cat > "$readme_file" <<EOF
# ${name^}

## TO-DO
1.
2.

## HOW-TO
1.
2.

## LOGBOOK
- $(date): Project initialized.

## ACKNOWLEDGE
1.
2.

## SEND-TO
1.
2.

## Deadlines
EOF

  cd "$target_dir" || return 1

  git init >/dev/null 2>&1
  git add . && git commit -m "Initial commit" >/dev/null

  echo "✅ Project '$name' created at $target_dir"
  echo "📂 Structure: src/, data/, docs/, tests/, README.md"

  if command -v nvim &>/dev/null; then
    nvim .
  elif command -v code &>/dev/null; then
    code .
  fi
}

# Zsh enhancements
bindkey -v
autoload -U zmv && alias mmv='noglob zmv -W'

# Optional enhancements
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Optional: Heroku autocomplete
HEROKU_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/heroku/autocomplete/zsh_setup"
[[ -f $HEROKU_AC_ZSH_SETUP_PATH ]] && source $HEROKU_AC_ZSH_SETUP_PATH

eval "$(starship init zsh)"
