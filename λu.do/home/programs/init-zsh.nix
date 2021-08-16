# programs :: zsh
{ config, pkgs, ...  }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll    = "ls -l";
      la    = "ls -al";
      loc   = "tokei";
      grep  = "rg";
      find  = "fd";
    };
    history = {
      size = 2048;
      share = true;
      ignoreDups = true;
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "denysdovhan/spaceship-zsh-theme"; tags = [ as:theme depth:1 ]; }
      ];
    };
  };
}
