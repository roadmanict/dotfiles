#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [ -n "$INTELLIJ_ENVIRONMENT_READER" ]; then
    return 0
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
function update_env {
    echo ""
    echo "Updating homebrew"
    brew update && brew upgrade

    echo ""
    echo "Updating zprezto"
    zprezto-update
    
    echo ""
    echo "Update ~/.config"
    git -C ~/.config pull

}

export JAVA_HOME=/usr/local/opt/openjdk
