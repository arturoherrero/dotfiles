#!/usr/bin/env bash

OFF='\[\033[0m\]'

RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
GRAY='\[\033[0;37m\]'
LRED='\[\033[0;91m\]'
LBLUE='\[\033[0;94m\]'
LPURPLE='\[\033[0;95m\]'

HOST='\h'
USR_COLOR=$GRAY
USR='\u'
DIR='\w'

export PROMPT_DIRTRIM=2

__system_prompt_git_status() {
  local git_dir=$1 status=$2
  local line xy ab
  local rebase="" dirty="" staged="" untracked="" stash="" output=""

  if [[ -d "$git_dir/rebase-merge" || -d "$git_dir/rebase-apply" ]]; then
    rebase=1
  fi

  while IFS= read -r line; do
    case $line in
      "1 "*|"2 "*|"u "*)
        xy=${line:2:2}
        [[ ${xy:0:1} != "." ]] && staged=1
        [[ ${xy:1:1} != "." ]] && dirty=1
        ;;
      "? "*) untracked=1 ;;
      "# stash "*) [[ ${line#"# stash "} -gt 0 ]] && stash=1 ;;
      "# branch.ab "*) ab=${line#"# branch.ab "} ;;
    esac
  done <<< "$status"

  [[ -n $rebase ]] && output+="${RED}REBASE${OFF}"
  [[ -n $dirty ]] && output+="${RED}*${OFF}"
  [[ -n $staged ]] && output+="${GREEN}+${OFF}"
  [[ -n $untracked ]] && output+="${LRED}%${OFF}"
  [[ -n $stash ]] && output+="${LBLUE}\$${OFF}"

  case $ab in
    "+0 -0") output+="=" ;;
    "+0 -"*) output+="<" ;;
    *" -0") output+=">" ;;
    ?*) output+="<>" ;;
  esac

  echo "$output"
}

__system_prompt_last_pwd=""
__system_prompt_git_dir=""

# git-dir only changes when $PWD changes, not on every prompt render. Must
# run directly from PROMPT_COMMAND (not via $(...), which always forks a
# subshell in bash and would discard these variable updates) so the cache
# actually persists across renders.
__system_prompt_update_git_dir() {
  if [[ $PWD != "$__system_prompt_last_pwd" ]]; then
    __system_prompt_last_pwd=$PWD
    __system_prompt_git_dir=$(git rev-parse --git-dir 2>/dev/null)
  fi
}

__system_prompt_inside_git() {
  [[ -z $__system_prompt_git_dir ]] && return

  local status branch
  status=$(git status --porcelain=2 --branch --show-stash 2>/dev/null)

  branch=$(sed -n 's/^# branch\.head //p' <<< "$status")
  [[ $branch == "(detached)" ]] && branch=$(git rev-parse --short HEAD 2>/dev/null)

  echo "{${GREEN}${branch}${OFF}$(__system_prompt_git_status "$__system_prompt_git_dir" "$status")}"
}

__system_prompt_command() {
  __system_prompt_update_git_dir
  echo -ne "\033]50;CurrentDir=$PWD\a"
  PS1="\[$(iterm2_prompt_mark)\]${INCOGNITO}${USR_COLOR}${USR}${OFF}@${HOST}:${LPURPLE}${DIR}${OFF}$(__system_prompt_inside_git)\$ "
}

PROMPT_COMMAND="history -a; __system_prompt_command"

incognito() {
  env HISTFILE=/dev/null INCOGNITO="[${RED}⌐■_■${OFF}] " bash -l
}
