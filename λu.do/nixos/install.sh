#!/bin/sh
sudo cp -r $(pwd)/* /etc/nixos/
nix-channel --update
sudo nixos-rebuild switch --flake '/etc/nixos#nixos-book'
