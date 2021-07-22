#!/bin/bash

path="$HOME/dothub.d/data.d/Res"
hack="$HOME/.config"

# bashrc
ln -sf $path/bashrc $HOME/.bashrc
ln -sf $path/.alias $HOME/.alias

# i3
if [ ! -d $hack/i3 ];then
    mkdir -p $hack/i3
    ln -sf $path/i3.conf $hack/i3/config
    ln -sf $path/i3-bar.toml $hack/i3/status.toml
    ln -sf $path/bg.jpeg $hack/i3/bg.jpeg
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

