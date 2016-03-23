ESCAPE="\[\e[G\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
CYAN="\[\e[0;36m\]"
PURPLE="\[\e[0;35m\]"
GRAY="\[\e[0;37m\]"
OFF="\[\e[0m\]"

HOST="\h"
USR="\u"
DIR="\w"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto git"
export GIT_PS1_DESCRIBE_STYLE="branch"
export PROMPT_DIRTRIM=2
export PROMPT_COMMAND="history -a; __git_ps1 "'"${GRAY}${USR}@${HOST}:${PURPLE}${DIR}${OFF}" "\$ " "{%s}"'
