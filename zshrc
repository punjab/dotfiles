# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails rails3 ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Load rvm
[[ -s "/Users/askang/.rvm/scripts/rvm" ]] && source "/Users/askang/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Add home bin directory
PATH=${PATH}:/Users/askang/bin

# Fix error in rake- zsh: no matches found: task[param]
alias rake='noglob rake'

# Add Drupal drush executable path ~/bin/drush/drush
# PATH=${PATH}:/Users/askang/bin/drush

# Add LATEX
export PATH="/usr/texbin:${PATH}"

# virtualenv. Using system default python 2.7.1
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Python Shell Startup file to enable readline
export PYTHONSTARTUP=~/.pythonrc

# Use Git from brew instead of Xcode
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Load tmuxinator for tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# vim is the default editor
export EDITOR=vim

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

# Alias
alias t="tmux attach"
alias cls="clear"
alias python-httpserver='python -c "import SimpleHTTPServer, SocketServer, BaseHTTPServer; SimpleHTTPServer.test(SimpleHTT    PServer.SimpleHTTPRequestHandler, type('"'"'Server'"'"', (BaseHTTPServer.HTTPServer, SocketServer.ThreadingMixIn, object),     {}))" 9090'
alias scheme="rlwrap mit-scheme -large"

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"
