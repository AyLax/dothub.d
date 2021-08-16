# programs :: git
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "aylax";
    userEmail = "zhoubye@foxmail.com"

  };
}
