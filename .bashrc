# Environment variables
JAVA_HOME="/opt/java"

GROOVY_HOME="/opt/groovy"
GRAILS_HOME="/opt/grails"
GANT_HOME="/opt/gant"

SCALA_HOME="/opt/scala"

CLOJURE_HOME="/opt/clojure"
alias clojure="java -jar $CLOJURE_HOME/clojure.jar"

PATH="$JAVA_HOME/bin:$PATH:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GANT_HOME/bin:$SCALA_HOME/bin"
export JAVA_HOME GROOVY_HOME GRAILS_HOME PATH


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


# SVN Hacks
alias svndel="svn st | grep ^? | awk '{print \"rm -rf \" \$2}' | sh"
alias svnadd="svn --force --depth infinity add ."
svndiff() {
    svn diff "$@" | colordiff
}


# RVM
export PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
