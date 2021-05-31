path="$HOME/dothub.d/data.d/Res"
ln -sf $path/bash.res $HOME/.bashrc

if [ ! -d $HOME/.config/i3 ];then
    mkdir -p $HOME/.config/i3
fi
ln -sf $path/i3.conf $HOME/.config/i3/config
ln -sf $path/i3-bar.toml $HOME/.config/i3/status.toml
ln -sf $path/bg.jpeg $HOME/.config/i3/bg.jpeg

if [ ! -d $HOME/.config/alacritty ];then
    mkdir -p $HOME/.config/alacritty
fi
ln -sf $path/alacritty.yml $HOME/.config/alacritty/alacritty.yml
