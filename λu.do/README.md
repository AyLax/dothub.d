## Config with Nix

>> Use Nix :: Flake && Nix :: Home Manager
[home manager page](https://github.com/nix-community/home-manager)

### dir
- /home # control by flake && home-manager
- /system # control by nix-os


### FAQ

```
# Q: Error: failed to extract archive (truncated gzip input)
# A: 
nix-collect-garbage


# Q: Error Occurs When Home-Manager Version Change
# A: 
rm /nix/var/nix/profiles/per-user/aylax/home-manager*
rm /nix/var/nix/gcroots/per-user/aylax/current-home
# Then reinstall home-manager

```
