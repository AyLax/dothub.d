path="$HOME/dothub.d/data.d/Res"
ln -sf $path/bash.res $HOME/.bashrc

if [ ! -d $HOME/.config/i3 ];then
    mkdir -p $HOME/.config/i3
fi
ln -sf $path/i3.conf $HOME/.config/i3/config
ln -sf $path/i3-bar.toml $HOME/.config/i3/status.toml

if [ ! -d $HOME/.config/kitty ];then
    mkdir -p $HOME/.config/kitty
fi
ln -sf $path/kitty.conf $HOME/.config/kitty/kitty.conf
