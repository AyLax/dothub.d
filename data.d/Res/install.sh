path="$HOME/dothub.d/data.d/Res"
cat $path/bash.res > $HOME/.bashrc

if [ ! -d $HOME/.config/i3 ];then
    mkdir -p $HOME/.config/i3
fi
cat $path/i3.res > $HOME/.config/i3/config
cat $path/i3.status.toml > $HOME/.config/i3/status.toml

if [ ! -d $HOME/.config/sakura ];then
    mkdir -p $HOME/.config/sakura
fi
cat $path/sakura.res > $HOME/.config/sakura/sakura.conf
