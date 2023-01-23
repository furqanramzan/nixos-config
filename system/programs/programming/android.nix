{configs, ...}: let
  inherit (configs) username;
in {
  programs.adb.enable = true;
  users.users.${username}.extraGroups = ["adbusers"];
  environment = {
    variables = {
      ANDROID_SDK_ROOT = "$HOME/.local/share/android";
    };
  };
}
