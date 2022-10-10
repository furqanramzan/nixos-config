{
  config,
  pkgs,
  ...
}: {
  android-sdk = {
    enable = true;
    packages = sdk:
      with sdk; [
        build-tools-30-0-3
        build-tools-33-0-0
        emulator
        cmdline-tools-latest
        platforms-android-33
        platforms-android-30
        platforms-android-32
        platforms-android-31
        sources-android-33
        ndk-21-4-7075529
        patcher-v4
        cmake-3-18-1
        platform-tools
      ];
  };
  home.packages = with pkgs; [
    android-studio
    android-tools
  ];
}
