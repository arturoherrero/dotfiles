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
shopt -s autocd cdspell dirspell globstar

# cd only autocompletes directories
complete -d cd

# EDITOR
export EDITOR=vim
