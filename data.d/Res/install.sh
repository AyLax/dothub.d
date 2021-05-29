if [ ! -d $HOME/.config/i3 ];then
    mkdir -p $HOME/.config/i3
fi
path="$HOME/dothub.d/data.d/Res"
ln -sf $path/i3.res $HOME/.config/i3/config
ln -sf $path/i3.status.toml $HOME/.config/i3/status.toml
ln -sf $path/urxvt.res $HOME/.Xdefaults
ln -sf $path/bash.res $HOME/.bashrc
