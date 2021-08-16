# home :: source
{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    ripgrep       # fast grep
    fzf           # fuzzy finder
    zoxide        # auto jump
    zsh           # alternative for bash
    tree          # list as tree-like format
  ];
}
