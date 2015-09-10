# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/

# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git rails ruby textmate)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#************************************************************************ LOAD


# Mactex paths
eval `/usr/libexec/path_helper -s`

for file in ~/.{path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Load tmuxinator for tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# To use Homebrew's directories rather than ~/.rbenv add to your profile:
export RBENV_ROOT=/usr/local/var/rbenv

# To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# alias git=hub

# Extended mv command
autoload -U zmv
alias mmv='noglob zmv -W'

# ls is always long
alias ls="ls -ltch"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim -v"

# Path for PSQL app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# show/hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# MYSQL using MAMP
export PATH=/usr/local/bin:/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php5.5.14/bin:$PATH
#export PATH=./bin:$PATH

source /usr/local/opt/nvm/nvm.sh

# Git Shortcuts
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '
alias mp3='mpsyt'
alias be='bundle exec'
alias ber='bundle exec rspec'

# Lighthouse Labs shit
alias compass_ssh='ssh root@compass.lighthouselabs.ca'
alias lighthouse_ssh='ssh root@107.170.157.51'

# alias
alias mp3c='for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -ab 320k "${f%.m4a}.mp3"; done'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

source ~/.aliases

