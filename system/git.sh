#!/usr/bin/env bash

__system_git_current_branch() {
  git branch --show-current
}

# git push -f
# git push --force
# Show a confirmation when forcing a push on master branch.
__system_git_push_confirmation_master_branch_force() {
  if [ "$(__system_git_current_branch)" == "master" ]; then
    read -p "Force pushing to master branch. Are you sure? " -r
    if [[ $REPLY =~ ^(yes|y|Y)$ ]]; then
      git "$@"
    fi
  else
    git "$@"
  fi
}

# $ git push
__system_git_push() {
  if [[ "$*" == "push -f"* || "$*" == "push --force"* ]]; then
    __system_git_push_confirmation_master_branch_force "$@"
  else
    git "$@"
  fi
}

# $ git clone
__system_git_clone() {
  name="${3:-${2##*/}}"
  git "$@" && cd "${name%.git}" || return
}

__system_git() {
  if [[ "$1" == "push" ]]; then
    __system_git_push "$@"
  elif [[ "$1" == "clone" ]]; then
    __system_git_clone "$@"
  else
    git "$@"
  fi
}

alias git='__system_git'

_git_jump() {
  __gitcomp_nl "$(__git_heads)"
}

_git_remove() {
  __gitcomp_nl "$(__git_heads)"
}

_git_integrate() {
  __gitcomp_nl "$(__git_heads)"
}

_git_co() {
  __gitcomp_nl "$(__git_heads)"
}

export PATH="$(__system_dotfiles_dir)/git-commands:$PATH"
