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

function todo_sync {
    echo ""
    echo "Commit todo changes"
    git -C ~/.config/todo add -A
    git -C ~/.config/todo commit -m "Update todo"
    git -C ~/.config/todo pull --rebase
    git -C ~/.config/todo push

    git -C ~/.config add todo
    git -C ~/.config commit -m "Update todo"
    echo "Finished committing todo changes"
}

# Customize to your needs...
function update_env {
    echo ""
    echo "Updating ./config submodules"
    git -C ~/.config submodule update --init --remote --rebase

    echo ""
    echo "Updating homebrew"
    brew update && brew upgrade

    echo ""
    echo "Updating zprezto"
    zprezto-update
    
    echo ""
    echo "Update ~/.config"
    git -C ~/.config pull

    # echo ""
    # echo "Update nvim Packer"
    # NVIM_APPNAME=nvim nvim ~/.config/nvim/lua/roadmanict/packer.lua --headless -c 'autocmd User PackerComplete quitall' -c 'so' -c 'PackerSync'

    echo ""
    echo "Update nvim Lazy"
    NVIM_APPNAME=nvim nvim --headless "+Lazy! update" +qa
}

function parse_transactions {
    date=$(date '+%Y-%m-%d'); for acc in persoonlijk persoonlijk_sparen gezamelijk gezamelijk_sparen; do cargo run -- -a $acc $1 > $date-$acc.csv; done
}

function jdk {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}

export JAVA_HOME=/usr/local/opt/openjdk
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/.config/brew/Brewfile
