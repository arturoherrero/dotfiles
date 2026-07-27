# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Homebrew
brew_bin="/opt/homebrew/bin/brew"
brew_shellenv_cache="$HOME/.cache/brew_shellenv.sh"
if [ -e "$brew_bin" ]; then
  if [ ! -e "$brew_shellenv_cache" ] || [ "$brew_bin" -nt "$brew_shellenv_cache" ]; then
    mkdir -p "$(dirname "$brew_shellenv_cache")"
    "$brew_bin" shellenv > "$brew_shellenv_cache"
  fi
  source "$brew_shellenv_cache"
fi
export HOMEBREW_NO_ENV_HINTS=1

# Bash completion 2
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# mise
eval "$(/opt/homebrew/bin/mise activate bash)"

# fzf
# CTRL-t = fzf select
# CTRL-r = fzf history
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--layout reverse --border --margin 3%"

source ~/.profile
source ~/.bash_settings

for file in "$DOTFILES_DIR"/system_bash/*; do
  source "$file"
done
