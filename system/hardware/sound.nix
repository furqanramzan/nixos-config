{
  # sound = {
  #   # ALSA sound enable
  #   enable = true;
  #   mediaKeys = {
  #     # Keyboard Media Keys (for minimal desktop)
  #     enable = true;
  #   };
  # };

  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  security = {
    # Not strictly required but pipewire will use rtkit if it is present
    rtkit = {
      enable = true;
    };
  };
}
