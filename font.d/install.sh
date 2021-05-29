#!/bin/bash
ln -sf $HOME/dothub.d/font.d $HOME/.fonts
fc-cache -fv $HOME/.fonts
