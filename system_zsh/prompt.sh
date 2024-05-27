#!/usr/bin/env zsh

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST

USR='%n'
DIR='%(4~|%-1~/.../%2~|%3~)'

__system_prompt_inside_git() {
  if [[ -d .git ]]; then
    echo "{%F{green}${vcs_info_msg_0_}%f}"
  fi
}

PROMPT='$USR@$HOST:%F{magenta}$DIR%f$(__system_prompt_inside_git)$ '
