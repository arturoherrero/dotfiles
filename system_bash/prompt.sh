#!/usr/bin/env bash

OFF='\[\033[0m\]'

# Regular colors
BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
GRAY='\[\033[0;37m\]'

# Light colors
LBLACK='\[\033[0;90m\]'
LRED='\[\033[0;91m\]'
LGREEN='\[\033[0;92m\]'
LYELLOW='\[\033[0;93m\]'
LBLUE='\[\033[0;94m\]'
LPURPLE='\[\033[0;95m\]'
LCYAN='\[\033[0;96m\]'
LWHITE='\[\033[0;97m\]'

# Bold colors
BGRAY='\[\033[1;30m\]'
BRED='\[\033[1;31m\]'
BGREEN='\[\033[1;32m\]'
BYELLOW='\[\033[1;33m\]'
BBLUE='\[\033[1;34m\]'
BPURPLE='\[\033[1;35m\]'
BCYAN='\[\033[1;36m\]'
BWHITE='\[\033[1;37m\]'

# Bold light colors
BLBLACK='\[\033[1;90m\]'
BLRED='\[\033[1;91m\]'
BLGREEN='\[\033[1;92m\]'
BLYELLOW='\[\033[1;93m\]'
BLBLUE='\[\033[1;94m\]'
BLPURPLE='\[\033[1;95m\]'
BLCYAN='\[\033[1;96m\]'
BLWHITE='\[\033[1;97m\]'

HOST='\h'
USR_COLOR=$GRAY
USR='\u'
DIR='\w'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto git"
export GIT_PS1_DESCRIBE_STYLE="branch"
export PROMPT_DIRTRIM=2

__system_prompt_git_status() {
  git_status=$(git status --ahead-behind)
  output=" "

  if [[ $git_status == *"interactive rebase in progress"* ]]; then output="${RED}REBASE${OFF}"; fi
  if [[ $git_status == *"Changes not staged for commit:"* ]]; then output+="${RED}*${OFF}"; fi
  if [[ $git_status == *"Changes to be committed:"* ]]; then output+="${GREEN}+${OFF}"; fi
  if [[ $git_status == *"Untracked files:"* ]]; then output+="${LRED}%${OFF}"; fi
  if [[ $(git stash list) ]]; then output+="${LBLUE}\$${OFF}"; fi
  if [[ $output == " " ]]; then output=""; fi

  case $git_status in
    *"Your branch is up to date with"*) output+="=";;
    *"Your branch is ahead of"*) output+=">";;
    *"Your branch is behind"*) output+="<";;
    *"refer to different commits"*|*"have diverged"*) output+="<>";;
  esac

  echo "$output"
}

__system_prompt_inside_git() {
  if [[ -d .git ]]; then
    echo "{${GREEN}$(__system_git_current_branch)${OFF}$(__system_prompt_git_status)}"
  fi
}

__system_prompt_command() {
  echo -ne "\033]50;CurrentDir=$PWD\a"
  PS1="${USR_COLOR}${USR}${OFF}@${HOST}:${LPURPLE}${DIR}${OFF}$(__system_prompt_inside_git)\$ "
}

PROMPT_COMMAND="history -a; __system_prompt_command"
