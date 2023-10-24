#!/bin/sh

MACHINE="${MACHINE:-linux}"

rm -f ~/.config/brew/Brewfile
cat ~/.config/brew/Brewfile-base > ~/.config/brew/Brewfile

if [ "$MACHINE" = "macbook-ibm" ]; then
    cat ~/.config/brew/Brewfile-ibm >> ~/.config/brew/Brewfile
fi

