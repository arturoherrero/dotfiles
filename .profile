# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

# Bash completion 2
source $(brew --prefix)/share/bash-completion/bash_completion

for file in $(__system_dotfiles_dir)/system/*; do
  source $file
done
