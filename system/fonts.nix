{pkgs, ...}: {
  fonts = {
    fonts = with pkgs; [
      # Fonts
      ubuntu_font_family
      carlito # NixOS
      vegur # NixOS
      source-code-pro
      jetbrains-mono
      font-awesome # Icons
      corefonts # MS
      nafees # Urdu
      (nerdfonts.override {fonts = ["FiraCode"];})
    ];
  };
}
