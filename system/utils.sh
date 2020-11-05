#!/usr/bin/env bash

# Find a file by name. $ fd name [directory]
fd() {
  find ${2-.} -type f -iname "*$1*"
}

# Short hash from regular hash
hashify() {
  echo "$1" | cut -c1-7
}

# Show private ip address
ip_private() {
  ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{ gsub("addr:", ""); print $2 }'
}

# Show public ip address
ip_public() {
  dig +short whoami.akamai.net @ns1-1.akamaitech.net
}

# Kill a process by name
killit() {
  pgrep -f "$1" | xargs kill -9
}

# Create a directory and change into it
mcd() {
  mkdir -p "$1" && cd "$_" || exit
}
alias mkdircd=mcd

# Time && Date
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# Show PATH in a human-readable way
alias path='tr ":" "\n" <<< $PATH'

# Simple HTTP server
alias simpleServer="python -m http.server"

# Source the profile file
alias sourceme="source ~/.profile"

# Create a new file and auto create the directory if not exist
touchp() {
  mkdir -p "$(dirname "$1")" && touch "$1"
}

# Update dotfiles
updateme() {
  (cd "$(__system_dotfiles_dir)" && git pull)
}
