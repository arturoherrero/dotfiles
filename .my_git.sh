#!/usr/bin/env sh

# $ git browse
# Open a Bitbucket page in the default browser.
git_browse() {
  local domain="$(git ls-remote --get-url | cut -c 5- | cut -d: -f1)"
  local url="$(git ls-remote --get-url | cut -c 5- | cut -d: -f2)"

  if [ "$domain" == "bitbucket.org" ]; then
    open https://bitbucket.org/$url
  else
    git "$@"
  fi
}

# $ git push
# Error pushing to a remote repository.
# Push the current branch and set the remote as upstream.
git_push() {
  local stderr=$(\git "$@" 2> >(tee /dev/stderr | head -n 1))
  local current_branch=`git rev-parse --abbrev-ref HEAD`
  local error="fatal: The current branch $current_branch has no upstream branch."

  if [ "$stderr" == "$error" ]; then
    echo "↝ git push --set-upstream origin $current_branch"
    git push --set-upstream origin $current_branch
  fi
}

my_git() {
  if [ "$1" == "browse" ]; then
    git_browse "$@"
  elif [ "$1" == "push" ]; then
    git_push "$@"
  else
    git "$@"
  fi
}

alias git="my_git $*"

_git_jump() {
  _git_branch
}

_git_remove() {
  _git_branch
}
