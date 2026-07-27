#!/usr/bin/env zsh

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST

USR='%n'
DIR='%(4~|%-1~/.../%2~|%3~)'

__system_prompt_git_dir=""

# git-dir only changes when $PWD changes, not on every prompt render, so
# only re-derive it then instead of forking git rev-parse every command.
chpwd() {
  __system_prompt_git_dir=$(git rev-parse --git-dir 2>/dev/null)
}
chpwd

# Skip vcs_info's own git forks entirely outside a repo.
precmd() {
  [[ -n $__system_prompt_git_dir ]] && vcs_info
}

__system_prompt_inside_git() {
  [[ -n $__system_prompt_git_dir ]] && echo "{%F{green}${vcs_info_msg_0_}%f}"
}

PROMPT='$USR@$HOST:%F{magenta}$DIR%f$(__system_prompt_inside_git)$ '
