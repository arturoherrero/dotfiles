# Source system configuration files
__system_dotfiles_dir() {
  dirname "$(readlink ~/.profile)"
}

for file in $(__system_dotfiles_dir)/system/*; do
  source $file
done

# Homebrew
test -e "/opt/homebrew/bin/brew" && eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
test -e "$(brew --prefix asdf)/libexec/asdf.sh" && source "$(brew --prefix asdf)/libexec/asdf.sh"
