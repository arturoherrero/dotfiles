#!/usr/bin/env sh

# $ git browse
# Open a Bitbucket page in the default browser.
function git_browse {
  if [ "$1" == "browse" ]; then
    local domain="$(git ls-remote --get-url | cut -c 5- | cut -d: -f1)"
    local url="$(git ls-remote --get-url | cut -c 5- | cut -d: -f2)"

    if [ "$domain" == "bitbucket.org" ]; then
      open https://bitbucket.org/$url
    else
      git "$@"
    fi
  else
    git "$@"
  fi
}

alias git="git_browse $*"
