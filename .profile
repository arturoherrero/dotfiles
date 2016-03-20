# Source system configuration files
dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}
source "$(dotfiles_dir)/system/aliases.sh"
source "$(dotfiles_dir)/system/environment.sh"
source "$(dotfiles_dir)/system/git.sh"
source "$(dotfiles_dir)/system/history.sh"
source "$(dotfiles_dir)/system/prompt.sh"
source "$(dotfiles_dir)/system/utils.sh"
source "$(dotfiles_dir)/system/utilsosx.sh"

# Homebrew
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

# rbenv
eval "$(rbenv init -)"
