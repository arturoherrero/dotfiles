# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

for file in $(__system_dotfiles_dir)/system/*; do
  source $file
done

# mise
eval "$(/opt/homebrew/bin/mise hook-env)"

# rg / ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
