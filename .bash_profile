# GIT
source ~/.git-prompt.sh
source ~/.git-completion.bash
eval "$(hub alias -s)"
source ~/.hub.bash_completion.sh
source ~/.my_git.sh


# Prompt
ESCAPE="\[\e[G\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
BLUE="\[\e[0;34m\]"
CYAN="\[\e[0;36m\]"
PURPLE="\[\e[0;35m\]"
GRAY="\[\e[0;37m\]"
OFF="\[\e[0m\]"

HOST="\h"
USR="\u"
DIR="\W"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto git"
export GIT_PS1_DESCRIBE_STYLE="branch"
export PROMPT_COMMAND='__git_ps1 "${GRAY}${USR}@${HOST}:${PURPLE}${DIR}${OFF}" "\$ " "{%s}"'


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


# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth


# EDITOR
export EDITOR=vim


# Homebrew
source `brew --repository`/Library/Contributions/brew_bash_completion.sh


# rbenv
eval "$(rbenv init -)"


# Alias
alias sourcetree="open -a SourceTree ."
alias path="tr ':' '\n' <<< $PATH"
alias vi=vim
alias guard="bundle exec guard"
alias rails="bundle exec rails"
alias rake="bundle exec rake"
alias rake_db_migrate="rake db:migrate && rake db:test:prepare"
alias rspec="bundle exec rspec"


# OS X
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}
