{ config, pkgs, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "dd94a849df69fe62fe2cb23a74c2b9330f1189ed"; # the commit to fetch 
    ref = "release-18.09"; # the branch to follow: release-xx.yy for stable nixos or master for nixos-unstable.
  };
in
{
    imports = [
      (import "${home-manager}/nixos")
    ];

    home-manager.users.my_username = {
      /* Here goes your home-manager config, eg home.packages = [ pkgs.foo ]; */
    }
}
