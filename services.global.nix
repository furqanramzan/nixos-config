{
  xserver = {
    # Enable the X11 windowing system.
    enable = true;
    layout = "us";
    xkbVariant = "";
    windowManager = {
      # Enable the i3 window manager.
      i3 = {
        enable = true;
      };

    };
    displayManager = {
      # Enable lightdm display manager.
      lightdm = {
        enable = true;
      };
      # Default session when login, can be change when login.
      defaultSession = "none+i3";
    };
  };
  # Enable CUPS to print documents.
  printing = {
    enable = true;
  };
  # Sound
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
  logind = {
    lidSwitch = "ignore"; # Laptop does not go to sleep when lid is closed
  };
  tlp = {
    enable = true; # TLP and auto-cpufreq for power management
  };
}
