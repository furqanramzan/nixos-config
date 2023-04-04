{
  imports = [
    # ./verdaccio
    # ./nginxproxy
    ./mongodb.nix
  ];

  virtualisation.oci-containers.backend = "docker";
}
