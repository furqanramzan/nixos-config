{
  services = {
    # TLP and auto-cpufreq for power management
    tlp = {
      enable = true;
    };
    # To use TLP have to explicitly disable power power profiles daemon
    power-profiles-daemon.enable = false;
  };
}
