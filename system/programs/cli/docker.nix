{
  pkgs,
  configs,
  ...
}: let
  inherit (configs) username;
in {
  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = ["docker"];
  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
  ];
}
