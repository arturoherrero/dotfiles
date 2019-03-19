#!/usr/bin/env bash

alias python=python3
alias pip=pip3

if which virtualenvwrapper.sh > /dev/null; then
  export WORKON_HOME=$HOME/.virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  source `which virtualenvwrapper.sh`
fi
