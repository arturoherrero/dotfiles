# Source system configuration files
dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}
for file in $(dotfiles_dir)/system/*; do
  source $file
done

# Bash completion 2
source $(brew --prefix)/share/bash-completion/bash_completion

# rbenv
eval "$(rbenv init -)"
