source ~/.profile

# Homebrew
test -e "/opt/homebrew/bin/brew" && eval "$(/opt/homebrew/bin/brew shellenv)"

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Bash completion 2
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# asdf
test -e "$(brew --prefix asdf)/libexec/asdf.sh" && source "$(brew --prefix asdf)/libexec/asdf.sh"
