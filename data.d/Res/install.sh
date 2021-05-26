RES_PATH=$HOME/dothub.d/data.d/Res
cd $RES_PATH
echo $RES_PATH
cat i3.res > $HOME/.config/i3/config
cat i3.status.toml > $HOME/.config/i3/status.toml
cat urxvt.res > $HOME/.Xdefaults
cat alias.res >> $HOME/.bashrc
