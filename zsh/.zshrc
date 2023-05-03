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

    echo ""
    echo "Update nvim Packer"
    nvim ~/.config/nvim/lua/roadmanict/packer.lua --headless -c 'autocmd User PackerComplete quitall' -c 'so' -c 'PackerSync'
}

export JAVA_HOME=/usr/local/opt/openjdk
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/.config/brew/Brewfile
