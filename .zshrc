# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

eval "$(/opt/homebrew/bin/mise activate zsh)"
source ~/.profile
source ~/.z_settings

for file in $(__system_dotfiles_dir)/system_zsh/*; do
  source $file
done
