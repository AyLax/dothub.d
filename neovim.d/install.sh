#!/bin/bash
path="$HOME/.config"
repo="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
file=${path}/nvim/autoload/plug.vim
if [ ! -d ${path} ];then
  mkdir $HOME/.config
fi
ln -s $HOME/dothub.d/neovim.d $HOME/.config/nvim
if [ ! -f ${file} ];then
  curl -fLo ${file} --create-dirs ${repo}
fi
