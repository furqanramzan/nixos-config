{
  pkgs,
  configs,
  ...
}: let
  inherit (configs) username;
in {
  programs.adb.enable = true;
  users.users.${username}.extraGroups = ["adbusers"];
}
