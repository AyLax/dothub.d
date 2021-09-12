#!/bin/bash

path="$HOME/archive.dotnotes/assets"
hack="$HOME/.config"

# bashrc
ln -sf $path/bashrc $HOME/.bashrc
ln -sf $path/.alias $HOME/.alias

# i3
if [ ! -d $hack/i3 ];then
    mkdir -p $hack/i3
    ln -sf $path/i3.conf $hack/i3/config
    ln -sf $path/i3-bar.toml $hack/i3/status.toml
fi

# alacritty terminal
if [ ! -d $hack/alacritty ];then
    mkdir -p $hack/alacritty
    ln -sf $path/alacritty.yml $hack/alacritty/alacritty.yml
fi

# picom
if [ ! -d $hack/picom ];then
    mkdir -p $hack/picom
    ln -sf $path/picom.conf $hack/picom/picom.conf
fi

