#!/usr/bin/env bash

# Battery time remaining
battery() {
  pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';' | cut -f2 -d' '
}


# cd to into the current Finder location
cdf() {
  target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
  if [ "$target" != "" ]; then
    cd "$target" || exit
    pwd
  else
    echo 'No Finder window found' >&2
  fi
}


# Generate a random password and copy to clipboard
generate_password() {
  LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 32 | pbcopy
}


# Open the current location/repository with SourceTree
alias sourcetree="open -a SourceTree ."


# tailf - follow the growth of a log file
tailf() {
  tail -f "$@"
}


# Move to the trash
trash() {
  mv "$@" ~/.Trash
}
