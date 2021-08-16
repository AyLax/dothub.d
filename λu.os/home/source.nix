# home :: source
{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    alacritty     # termimal (Rust)
    fzf           # fuzzy finder
    ripgrep       # fast grep
    tree          # list as tree-like format
    zoxide        # auto jump
    zsh           # alternative for bash
  ];
}
