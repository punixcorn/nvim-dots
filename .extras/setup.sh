#!/bin/bash 
nvimdir="$HOME/.config/nvim"

function error(){
    printf "%s\n" "$1"
    exit 1 
}

./installPlug.sh || error "\e[31mERR: installing PlugInstall Failed"

[ -d $nvimdir ] &&  mv $nvimdir "$HOME/.config/nvim_backup " && cd .. && cp -r * $nvimdir || error "\e[31mERR: \e[0mcould not find $nvimdir or could not copy over files"

[ -f $nvimdir/init.vim ] && nvim +PlugInstall || error "\e[32mERR: \e[0m could not run PlugInstall, open $nvimdir/init.vim and run :PlugInstall "


