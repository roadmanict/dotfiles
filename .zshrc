# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/geertweggemans/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Created by newuser for 5.3.1
fpath=(/usr/local/share/zsh-completions $fpath)
source  ~/.zsh/powerlevel9k/powerlevel9k.zsh-theme
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

DEFAULT_USER=geertweggemans
