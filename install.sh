#!/bin/bash

echo "Installing dependencies"
sudo pacman -Sy git tree-sitter nodejs python-pynvim luarocks clang npm lua-language-server

if [[ -f /bin/yay ]]; then
    yay -S vscode-langservers-extracted
else
    sudo npm i -g vscode-langservers-extracted
fi

# installation?
# meh
