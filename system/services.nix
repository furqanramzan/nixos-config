{
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      layout = "us";
      xkbVariant = "";
      # windowManager = {
      #   # Enable the i3 window manager.
      #   i3 = {
      #     enable = true;
      #   };

      # };
      # displayManager = {
      #   # Enable lightdm display manager.
      #   sddm = {
      #     enable = true;
      #   };
      #   autoLogin.enable = true;
      #   # Default session when login, can be change when login.
      #   defaultSession = "sway";
      # };
      libinput = {
        # Trackpad support & gestures
        enable = true;
        touchpad = {
          tapping = true;
          scrollMethod = "twofinger";
          naturalScrolling = true; # The correct way of scrolling
          accelProfile = "adaptive"; # Speed settings
          #accelSpeed = "-0.5";
          disableWhileTyping = true;
        };
      };
    };
    # Enable CUPS to print documents.
    printing = {
      enable = true;
    };
    # Automatic CPU speed & power optimizer for Linux based on active monitoring of laptop's battery state
    auto-cpufreq = {
      enable = true;
    };
    # Blutooth Manager
    blueman = {
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
    # Enable the OpenSSH daemon. 
    # openssh = {
    #   enable = true;
    # };

  };
}
