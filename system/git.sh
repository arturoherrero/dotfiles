#!/usr/bin/env bash

eval "$(hub alias -s)"

# $ git browse
# Open a Bitbucket page in the default browser.
__system_git_browse() {
  domain="$(git ls-remote --get-url | cut -c 5- | cut -d: -f1)"
  url="$(git ls-remote --get-url | cut -c 5- | cut -d: -f2)"

  if [ "$domain" == "bitbucket.org" ]; then
    open https://bitbucket.org/"$url"
  else
    git "$@"
  fi
}

__system_git_current_branch() {
  git rev-parse --abbrev-ref HEAD
}

# $ git push
# Prevent error when push to a remote repository without upstream branch.
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
# Show a confirmation when force a push on master branch.
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
  if [ "$1" == "browse" ]; then
    __system_git_browse "$@"
  elif [ "$1" == "push" ]; then
    __system_git_push "$@"
  else
    git "$@"
  fi
}

alias git='__system_git'

_git_jump() {
  _git_branch
}

_git_remove() {
  _git_branch
}
