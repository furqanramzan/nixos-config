{ pkgs, ... }:

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
      displayManager = {
      #   # Enable lightdm display manager.
        sddm = {
          enable = true;
        };
      #   autoLogin.enable = true;
      #   # Default session when login, can be change when login.
        # defaultSession = "sway";
      };
      desktopManager = {
        plasma5.enable = true;
      };
      # libinput = {
        # Trackpad support & gestures
        # enable = true;
        # touchpad = {
          # tapping = true;
          # scrollMethod = "twofinger";
          # naturalScrolling = true; # The correct way of scrolling
          # accelProfile = "adaptive"; # Speed settings
          #accelSpeed = "-0.5";
          # disableWhileTyping = true;
        # };
      # };
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
    # blueman = {
      # enable = true;
    # };

    # logind = {
      # lidSwitch = "ignore"; # Laptop does not go to sleep when lid is closed
    # };
    tlp = {
      enable = true; # TLP and auto-cpufreq for power management
    };
    mysql = {
      enable = true;
      package = pkgs.mysql80;
      settings = {
        mysqld = {
          default_authentication_plugin = "mysql_native_password";
        };
      };
    };
    # Enable the OpenSSH daemon. 
    # openssh = {
    #   enable = true;
    # };

  };
}
