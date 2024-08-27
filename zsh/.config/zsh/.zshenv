#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if type cargo &>/dev/null; then
    . "$HOME/.cargo/env"
fi

export DOTFILES_OS="Unknown"
os=$(uname -s)

# Set variables based on the output
if [ "$os" = "Darwin" ]; then
    # Mac
    export DOTFILES_OS="Macos"
elif [ "$os" = "Linux" ]; then
    # Linux
    export DOTFILES_OS="Linux"
fi

