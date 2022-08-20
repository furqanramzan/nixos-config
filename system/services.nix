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
        # autoLogin.enable = true;
        # # Default session when login, can be change when login.
        # defaultSession = "sway";
      };
      # libinput = {
      #   Trackpad support & gestures
      #   enable = true;
      #   touchpad = {
      #     tapping = true;
      #     scrollMethod = "twofinger";
      #     naturalScrolling = true; # The correct way of scrolling
      #     accelProfile = "adaptive"; # Speed settings
      #     accelSpeed = "-0.5";
      #     disableWhileTyping = true;
      #   };
      # };
    };
    # Blutooth Manager
    # blueman = {
    #   enable = true;
    # };

    # logind = {
    #   lidSwitch = "ignore"; # Laptop does not go to sleep when lid is closed
    # };
    # # Enable the OpenSSH daemon. 
    # openssh = {
    #   enable = true;
    # };
  };
}
