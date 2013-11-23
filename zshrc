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

#************************************************************************ PATH
# Add home bin directory
PATH=${PATH}:/Users/askang/bin

# Add LATEX
export PATH="/usr/texbin:${PATH}"

# Use Git from brew instead of Xcode
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# vim is the default editor
export EDITOR=vim

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Heroku
export PATH="/usr/local/heroku/bin:$PATH" 

#************************************************************************ ALIAS
alias t="tmux attach"
alias cls="clear"
# Fix error in rake- zsh: no matches found: task[param]
alias rake='noglob rake'

#************************************************************************ LOAD

# Load tmuxinator for tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Load rvm
[[ -s "/Users/askang/.rvm/scripts/rvm" ]] && source "/Users/askang/.rvm/scripts/rvm"  # This loads RVM into a shell session.
