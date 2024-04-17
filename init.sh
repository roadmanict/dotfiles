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
        zsh \
        pipx

    usermod -aG sudo $sudo_user

    sudo -i -u $sudo_user bash << EOF
        if [ ! -f ~/.ssh/known_hosts ]; then
            mkdir ~/.ssh
            chmod 700 ~/.ssh
            touch ~/.ssh/known_hosts
            chmod 600 ~/.ssh/known_hosts
            ssh-keyscan github.com >> ~/.ssh/known_hosts
        fi

        if [ ! -d ~/Projects/Personal/dotfiles ]; then
            mkdir -p ~/Projects/Personal
            git clone https://github.com/roadmanict/dotfiles.git ~/Projects/Personal/dotfiles
            git -C ~/Projects/Personal/dotfiles remote remove origin
            git -C ~/Projects/Personal/dotfiles remote add origin git@github.com:roadmanict/dotfiles.git
        fi

        sudo chsh -s /bin/zsh geert
EOF
fi

