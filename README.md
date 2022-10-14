## Install NixOS
```bash 
sudo nixos-install --flake .#config
```

## Delete all previous generations
```bash 
nix-collect-garbage -d && sudo nix-collect-garbage -d
```

## Generate default configuration
```bash 
nixos-generate-config --root .
```

## Format whole project
```bash 
alejandra .
```




## Tips and Tricks

To see octal file permissions on a Linux. [Click here](https://www.cyberciti.biz/faq/get-octal-file-permissions-from-command-line-on-linuxunix/) for more detail.
```bash 
stat -c '%A %a %n' destination
```

Monitor list using sway.
```bash 
swaymsg -t get_outputs
```

To fix `Got permission denied while trying to connect to the Docker daemon socket`.
```bash 
sudo chmod 666 /var/run/docker.sock
```
