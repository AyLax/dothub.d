{ config, pkgs, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "b39647e52ed3c0b989e9d5c965e598ae4c38d7ef"; # the commit to fetch 
    ref = "release-18.09"; # the branch to follow: release-xx.yy for stable nixos or master for nixos-unstable.
  };
in
{
    imports = [
      (import "${home-manager}/nixos")
    ];

    home-manager.users.aylax = {
      /* Here goes your home-manager config, eg home.packages = [ pkgs.foo ]; */
    }
}
