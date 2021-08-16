# home :: source
{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    ripgrep       # fast grep
    # zoxide        # auto jump
    zsh           # alternative for bash
    tree          # list as tree-like format
  ];
}
