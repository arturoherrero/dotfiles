#!/usr/bin/env bash

alias be="bundle exec"
alias cap="bundle exec cap"
alias guard="bundle exec guard"
alias rackup="bundle exec rackup"
alias rails="bundle exec rails"
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias rspec_parallel="rake parallel:spec"

alias jekyll="jekyll server --watch --future"

# rbenv
eval "$(rbenv init -)"

ruby_versions() {
  rbenv install -l
}
