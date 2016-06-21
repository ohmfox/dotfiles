export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

###-tns-completion-start-###
if [ -f /Users/cendaeg/.tnsrc ]; then
  source /Users/cendaeg/.tnsrc
fi
###-tns-completion-end-###

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

. ~/.aliases

export PS1="\[\033[38;5;50m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\n──── \[$(tput sgr0)\]"

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="$PATH:/Users/cendaeg/bin"
export CLICOLOR=1
export EDITOR=nvim
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
. ~/bin/z/z.sh

HISTFILE=~/.bash_history
HISTSIZE=5000
HISTFILESIZE=10000

shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
