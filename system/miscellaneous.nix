{
  # Set your time zone.
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      timeout = 2;
      # Enable EFI boot manager
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi/";
      };
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking = {
    hostName = "nixos"; # Define your hostname. 
    # Pick only one of the below networking options.
    # Enables wireless support via wpa_supplicant.
    # wireless = {
    #   enable = true;
    # } 
    # Easiest to use and most distros use this by default.
    networkmanager = {
      enable = true;
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us"; # or us/azerty/etc
  };

  sound = {
    # ALSA sound enable
    enable = true;
    mediaKeys = {
      # Keyboard Media Keys (for minimal desktop)
      enable = true;
    };
  };

  # hardware = {
  #   # Brightness control via xbacklight from users in the video group.
  #   acpilight = {
  #     enable = true;
  #   };
  # };
  security = {
    # Not strictly required but pipewire will use rtkit if it is present
    rtkit = {
      enable = true;
    };
  };

  environment = {
    # Add ~/.local/bin/ to $PATH 
    localBinInPath = true;
    variables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}