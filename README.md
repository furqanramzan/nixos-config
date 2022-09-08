## Monitor list:

`swaymsg -t get_outputs`

## Delete all previous generations
`nix-collect-garbage -d && sudo nix-collect-garbage -d`

## Generate default configuration
nixos-generate-config --root .


## Install NixOS
sudo nixos-install --flake .#config
