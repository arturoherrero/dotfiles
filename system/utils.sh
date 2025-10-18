#!/usr/bin/env bash

# Find a file by name. $ fd name [directory]
fd() {
  find "${2-.}" -type f -path "*$1*" -exec bash -c 'printf "%s\n" "$1" | grep --color=auto "$2"' _ {} "$1" \;
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
alias nowdate='date +"%d %B %Y"'
alias nowweek='date +"%V"'

# Show PATH in a human-readable way
alias path='tr ":" "\n" <<< $PATH'

# Remove lines from files
remove_lines() {
  pattern=$1
  escaped_pattern=$(echo "$pattern" | sed 's/\//\\\//g')
  git grep -l "$pattern" | xargs sed -i '' "/$escaped_pattern/d"
}

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
