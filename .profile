# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

for file in $(__system_dotfiles_dir)/system/*; do
  source $file
done
