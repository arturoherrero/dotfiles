# Environment variables
JAVA_HOME="/opt/java"
GROOVY_HOME="/opt/groovy"
GRAILS_HOME="/opt/grails"
GANT_HOME="/opt/gant"
PATH="$PATH:$JAVA_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GANT_HOME/bin"
export JAVA_HOME GROOVY_HOME GRAILS_HOME PATH


# PS1
RED="\[\e[0;31m\]"
BLUE="\[\e[0;34m\]"
CYAN="\[\e[0;36m\]"
PURPLE="\[\e[0;35m\]"
GRAY="\[\e[0;37m\]"
OFF="\[\e[0m\]"

HOST="\h"
USER="\u"
DIR="\W"

export PS1="${GRAY}${USER}@${HOST}:${PURPLE}${DIR}${OFF}\$ "


# EDITOR
export EDITOR=vim


# SVN Hacks
alias svndel="svn st | grep ^? | awk '{print \"rm -rf \" \$2}' | sh"
svndiff()
{
    svn diff "${@}" | colordiff
}


