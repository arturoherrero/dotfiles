# Enable colorized output
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Colored man pages
man() {
  env \
  LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;208m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;111m' \
  man "$@"
}

# Shopt Builtin
shopt -s autocd cdspell cmdhist dirspell globstar histappend

# cd only autocompletes directories
complete -d cd

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth

# EDITOR
export EDITOR=vim