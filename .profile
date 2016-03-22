# Source system configuration files
dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}
for file in $(dotfiles_dir)/system/*; do
  source $file
done

# Homebrew
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

# rbenv
eval "$(rbenv init -)"
