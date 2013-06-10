# Environment variables
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`


# PS1
ESCAPE="\[\e[G\]"
RED="\[\e[0;31m\]"
BLUE="\[\e[0;34m\]"
CYAN="\[\e[0;36m\]"
PURPLE="\[\e[0;35m\]"
GRAY="\[\e[0;37m\]"
OFF="\[\e[0m\]"

HOST="\h"
USER="\u"
DIR="\W"

export PS1="${ESCAPE}${GRAY}${USER}@${HOST}:${PURPLE}${DIR}${OFF}\$ "


# EDITOR
export EDITOR=vim


# GIT
source ~/.git-completion.bash


# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
