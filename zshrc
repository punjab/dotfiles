# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"


# Plugins (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
plugins=(git ruby colorize z  github gitignore)

# Heroku Autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Customize to your needs...
for file in $HOME/.{env,path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Vi mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship prompt
#export STARSHIP_CONFIG=~/.config/starship.toml
#eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source Oh My ZSH
source $ZSH/oh-my-zsh.sh

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/askang/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

export WORKON_HOME=~/.virtualenvs
. $(asdf where python)/bin/virtualenvwrapper.sh
