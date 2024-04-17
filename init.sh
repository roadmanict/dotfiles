#!/bin/sh
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
    apt update
    apt upgrade -y

    apt install -y \
        nfs-common \
        i3  \
        lightdm \
        alacritty
fi

