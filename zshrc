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

for file in ~/.{path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Load tmuxinator for tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Load rvm
[[ -s "/Users/askang/.rvm/scripts/rvm" ]] && source "/Users/askang/.rvm/scripts/rvm"  # This loads RVM into a shell session.
