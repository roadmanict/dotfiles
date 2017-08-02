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

bindkey "^[[3~" delete-char

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time)
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
source  ~/.zsh/powerlevel9k/powerlevel9k.zsh-theme

export NVM_DIR=~/.nvm
source $(/usr/local/bin/brew --prefix nvm)/nvm.sh

DEFAULT_USER=geertweggemans

ssh-add ~/.ssh/id_rsa
