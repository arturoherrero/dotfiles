# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

DOTFILES_DIR="$(__system_dotfiles_dir)"
export DOTFILES_DIR

for file in "$DOTFILES_DIR"/system/*; do
  source "$file"
done

# rg / ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
