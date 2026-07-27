#!/usr/bin/env bash

alias ...="cd ../.."
alias ....="cd ../../.."
alias cd..="cd .."
alias cd...="cd ../.."

alias ls="eza --group-directories-first"
alias la="ls -a"
alias ll="ls -la"
alias tree="eza --tree"
alias lt="eza --tree -L2"

alias df="df -h"
alias du="du -h"

alias ff="fzf --preview 'bat --color=always {}'"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias mount="mount | column -t"

alias rm='trash'

alias vi=vim

alias where=which
