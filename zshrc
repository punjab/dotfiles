export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# Plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git ruby colorize z github gitignore)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
for file in ~/.{env,path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Vi mode
bindkey -v


# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/bin/google-cloud-sdk/path.zsh.inc ]; then
  source '~/bin/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f ~/bin/google-cloud-sdk/completion.zsh.inc ]; then
  source '~/bin/google-cloud-sdk/completion.zsh.inc'
fi

export PATH=$PATH:~/bin

source '~/lib/azure-cli/az.completion'
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
