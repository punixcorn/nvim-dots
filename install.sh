#!/bin/bash

echo "Installing dependencies"
sudo pacman -Sy git tree-sitter node python-pynvim luarocks clangd npm lua-language-server

if [ -f /bin/yay ]; then
    yay -S vscode-langservers-extracted
else
    sudo npm i -g vscode-langservers-extracted
fi

# installation?
# meh
