#!/usr/bin/env bash

# Save all lines of a multiple-line command in the same history entry
shopt -s cmdhist

# Append to the history file, don't overwrite it
shopt -s histappend

# If the cmdhist option is enabled, multi-line commands are saved to the
# history with embedded newlines rather than using semicolon separators
shopt -s lithist

# Huge history. Doesn't appear to slow things down, so why not?
export HISTSIZE=500000
export HISTFILESIZE=100000

# Avoid duplicate entries
export HISTCONTROL=ignoreboth

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:pwd:bg:fg:history:clear"
