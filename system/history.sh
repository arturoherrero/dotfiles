# Save multi-line commands as one command
shopt -s cmdhist

# Append to the history file, don't overwrite it
shopt -s histappend

# Huge history. Doesn't appear to slow things down, so why not?
export HISTSIZE=500000
export HISTFILESIZE=100000

# Avoid duplicate entries
export HISTCONTROL=ignoreboth

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:pwd:bg:fg:history:clear"
