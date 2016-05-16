#!/usr/bin/env bash

alias be="bundle exec"
alias guard="bundle exec guard"
alias rails="bundle exec rails"
alias rake="bundle exec rake"
alias rake_db_migrate="rake db:migrate && rake db:test:prepare"

alias rspec="bundle exec rspec"
alias rspec_prepare="rake db:test:prepare"
alias rspec_pararell="rake parallel:spec"
alias rspec_pararell_prepare="rake parallel:prepare"

alias jekyll="jekyll server --watch --future"

# rbenv
eval "$(rbenv init -)"

ruby_versions() {
  rbenv install -l
}
