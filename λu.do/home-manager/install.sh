#!/user/bin sh

## Install home-manager
# nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz home-manager
# nix-channel --update
# nix-shell '<home-manager>' -A install


# Arg: $1 means machine:
# - macos-book
# - nixos-book
# [[ ! -d $HOME/.config ]] && mkdir -p $HOME/.config
# ln -sf $(pwd) $HOME/.config
nix-shell -p nixUnstable --command "nix build --experimental-features 'nix-command flakes' '.#$1'"

