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
    echo "Enter Your Name: "
    read -p "Enter your regular account name: " sudo_user </dev/tty

    apt update
    apt upgrade -y

    apt install -y \
        git \
        sudo
    usermod -aG sudo $sudo_user
fi

