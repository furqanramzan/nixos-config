{ pkgs-unstable, ... }:

{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs = {
    git = {
      enable = true;
    };
    # Whether to install Light backlight control command and udev rules granting access to members of the "video" group. 
    light.enable = true;
    neovim = {
      enable = true;
      # Make neovim default editor
      # defaultEditor = true;
      package = pkgs-unstable.neovim-unwrapped;
      # Bind vi alias to neovim
      viAlias = true;
    };
  };
}
