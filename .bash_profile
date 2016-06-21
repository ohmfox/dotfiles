
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

###-tns-completion-start-###
if [ -f /Users/cendaeg/.tnsrc ]; then 
    source /Users/cendaeg/.tnsrc 
fi
###-tns-completion-end-###

# If the shell is interactive and .bashrc exists, get the aliases and functions
if [[ $- == *i* && -f ~/.bashrc ]]; then
    . ~/.bashrc
fi


if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

##
# Your previous /Users/cendaeg/.bash_profile file was backed up as /Users/cendaeg/.bash_profile.macports-saved_2016-05-26_at_11:30:45
##

# MacPorts Installer addition on 2016-05-26_at_11:30:45: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
