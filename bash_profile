# August 9, 2011
# http://github.com/punjab
#
# ** .bash_profile vs .bashrc **
# -- .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
#
# ** login vs non-login shell **
# -- when login via console or ssh, .bash_profile is executed. When already logged in or type /bin/bash from prompt .bashrc is executed. Exception is Terminal.App which always calls .bash_profile
#
# **Solution**
# Keep all configurations in .bashrc and source it from .bash_profile.
#
# **Bibliography**
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

[[ -s "/Users/askang/.rvm/scripts/rvm" ]] && source "/Users/askang/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
