#!/usr/bin/env bash

__system_git_current_branch() {
  git branch --show-current
}

# $ git push
# Prevent error when pushing to a remote repository without upstream branch.
# Push the current branch and set the remote as upstream.
__system_git_push_creating_upstream_branch() {
  stderr=$(command git "$@" 2> >(tee /dev/stderr | head -n 1))
  current_branch=$(__system_git_current_branch)
  error="fatal: The current branch $current_branch has no upstream branch."

  if [ "$stderr" == "$error" ]; then
    echo "↝ git push --set-upstream origin $current_branch"
    git push --set-upstream origin "$current_branch"
  fi
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
    __system_git_push_creating_upstream_branch "$@"
  fi
}

# $ git push
__system_git_push() {
  if [[ "$@" == "push -f"* || "$@" == "push --force"* ]]; then
    __system_git_push_confirmation_master_branch_force "$@"
  else
    __system_git_push_creating_upstream_branch "$@"
  fi
}

__system_git() {
  if [ "$1" == "push" ]; then
    __system_git_push "$@"
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

export PATH="$(__system_dotfiles_dir)/git-commands:$PATH"
