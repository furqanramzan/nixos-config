{ pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    # Fonts
    carlito # NixOS
    vegur # NixOS
    source-code-pro
    jetbrains-mono
    font-awesome # Icons
    corefonts # MS
    terminus-nerdfont # Terminal Fonts
    nafees # Urdu
  ];
}
