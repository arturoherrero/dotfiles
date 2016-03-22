# Find a file by name
alias findit="find . -type f -name"

# Short hash from regular hash
hashify() {
  echo $1 | cut -c1-7
}

# Kill a process by name
killit() {
  pgrep -f "$1" | xargs kill -9
}

# Create a directory and change into it
mcd() {
  mkdir -p $1 && cd $_
}

# Time && Date
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# Show PATH in a human-readable way
alias path="tr ':' '\n' <<< $PATH"

# Source the profile file
alias sourceme="source ~/.profile"

# Update dotfiles
updateme() {
  (cd "$(dotfiles_dir)" && git pull)
}
