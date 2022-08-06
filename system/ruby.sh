#!/usr/bin/env bash

alias be="bundle exec"
alias cucumber="bundle exec cucumber"
alias guard="bundle exec guard"
alias rackup="bundle exec rackup"
alias rails="bundle exec rails"
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias rspec_parallel="rake parallel:spec"
alias rubocop="bundle exec rubocop"

alias jekyll="bundle exec jekyll server --livereload"

alias devlog="tail -f log/development.log"
alias testlog="tail -f log/test.log"

ruby_versions() {
  rbenv install -l
}
