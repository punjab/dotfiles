export TERM="xterm-256color"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
#ZSH_THEME="spaceship"

# Plugins (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
plugins=(git ruby colorize z github gitignore)

# Heroku Autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Source Oh My ZSH
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
for file in $HOME/.{env,path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Vi mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship prompt
export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"
