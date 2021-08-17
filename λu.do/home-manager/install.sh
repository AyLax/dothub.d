#!/user/bin sh

# Arg: $1 means machine:
# - mac
# - nixos
# [[ ! -d $HOME/.config ]] && mkdir -p $HOME/.config
# ln -sf $(pwd) $HOME/.config
nix-shell -p nixUnstable --command "nix build --experimental-features 'nix-command flakes' '.#$1'"

