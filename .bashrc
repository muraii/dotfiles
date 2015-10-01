#!/bin/bash -x
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lha'
alias df='df -h'
alias hgrep='history | grep $1'
alias ping='ping -c 2'

function g { links http://www.google.com/search?q="$1" ; }
function d { links http://www.duckduckgo.com/?q="$1" ; }

if [ "`id -u`" = "0" ];
    then
        export PS1="\[\e[31;1m\]\u@\H: \w #\[\e[0m\] "
    else
        export PS1="\[\e[32;1m\]\u@\H: \w \$\[\e[0m\] "
fi

