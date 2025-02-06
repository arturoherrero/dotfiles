# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

for file in $(__system_dotfiles_dir)/system/*; do
  source $file
done

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
