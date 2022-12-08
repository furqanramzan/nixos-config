{pkgs, ...}: {
  imports = [
    ./cpp.nix
    ./java.nix
    ./rust.nix
    ./node.nix
    ./python.nix
    ./php.nix
    # ./android.nix
  ];
  environment.systemPackages = with pkgs; [
    curl
    bat # Replacement of cat utility, with code formatting.
    ngrok # Exposes a web server running on local machine to the internet.
    openssl # A cryptographic library that implements the SSL and TLS protocols.
  ];
}
