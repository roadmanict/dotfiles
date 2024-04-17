#!/bin/bash
os=$(uname -s)
system="Unknown"

# Set variables based on the output
if [ "$os" = "Darwin" ]; then
    # Mac
    system="Macos"
elif [ "$os" = "Linux" ]; then
    # Linux
    system="Linux"
fi

echo "Operating System: $system"

if [ "$system" = "Linux" ]; then
    read -p "Enter your regular account name: " sudo_user </dev/tty

    apt update
    apt upgrade -y

    apt install -y \
        git \
        sudo \
        pipx

    usermod -aG sudo $sudo_user

    sudo -i -u $sudo_user bash << EOF
        mkdir ~/.ssh
        chmod 700 ~/.ssh
        touch ~/.ssh/known_hosts
        chmod 600 ~/.ssh/known_hosts
        ssh-keyscan github.com >> ~/.ssh/known_hosts

        mkdir -p ~/Projects/Personal

        git clone git@github.com:roadmanict/dotfiles ~/Projects/Personal/dotfiles

EOF
fi

