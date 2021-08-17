# services :: emacs

{ config, pkgs, libs, ... }:

{
  programs.emacs = {
    enable = true;
    
    package = if pkgs.stdenv.isDarwin then pkgs.emacsGcc else pkgs.emacsPgtkGcc;
  };
}
