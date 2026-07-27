# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

export DOTFILES_DIR="$(__system_dotfiles_dir)"

for file in "$DOTFILES_DIR"/system/*; do
  source $file
done

# mise
eval "$(/opt/homebrew/bin/mise hook-env)"

# rg / ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
