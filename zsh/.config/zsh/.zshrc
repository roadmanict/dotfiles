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
function jdk {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}

jdk 22 > /dev/null 2>&1

export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"

if type dotnet &>/dev/null; then
    export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
fi

if type fzf &>/dev/null; then
    eval "$(fzf --zsh)"
fi
if type brew &>/dev/null; then
    eval "$(hugo completion zsh)"
fi
if type az &>/dev/null; then
    autoload bashcompinit && bashcompinit
    source $(brew --prefix)/etc/bash_completion.d/az
fi
