export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it"ll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="bullet-train"
ZSH_THEME="refined"

# Plugins (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
plugins=(git ruby colorize z github gitignore)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
for file in $HOME/.{env,path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Vi mode
bindkey -v

# Python Configurations
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init - > /dev/null 2>&1)"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/bin/google-cloud-sdk/path.zsh.inc ]; then
  source "$HOME/bin/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME/bin/google-cloud-sdk/completion.zsh.inc ]; then
  source "$HOME/bin/google-cloud-sdk/completion.zsh.inc"
fi

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

fpath=($HOME/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

source ~/.iterm2_shell_integration.zsh

