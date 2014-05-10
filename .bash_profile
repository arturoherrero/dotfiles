# Environment variables
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`


# PS1
ESCAPE="\[\e[G\]"
RED="\[\e[0;31m\]"
BLUE="\[\e[0;34m\]"
CYAN="\[\e[0;36m\]"
PURPLE="\[\e[0;35m\]"
GRAY="\[\e[0;37m\]"
OFF="\[\e[0m\]"

HOST="\h"
USER="\u"
DIR="\W"

export PS1="${ESCAPE}${GRAY}${USER}@${HOST}:${PURPLE}${DIR}${OFF}\$ "


# Enable colorized output
export CLICOLOR=1


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


# History
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth


# EDITOR
export EDITOR=vim


# GIT
source ~/.git-completion.bash
eval "$(hub alias -s)"


# Homebrew
source `brew --repository`/Library/Contributions/brew_bash_completion.sh


# Alias
alias sourcetree="open -a SourceTree ."
alias path="tr ':' '\n' <<< $PATH"
alias vi=vim
