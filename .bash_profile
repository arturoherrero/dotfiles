# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Bash completion 2
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

source ~/.profile
source ~/.bash_settings

for file in $(__system_dotfiles_dir)/system_bash/*; do
  source $file
done
