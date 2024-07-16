# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

for file in $(__system_dotfiles_dir)/system/*; do
  source $file
done

# asdf
test -e "$(brew --prefix asdf)/libexec/asdf.sh" && source "$(brew --prefix asdf)/libexec/asdf.sh"
