# accounts :: ssh

{ config, pkgs, libs, ... }:
{
  home.file.".ssh/config".source = ../assets/configs/ssh/ssh_config;
}
