{
  imports = [
    # ./verdaccio
    # ./nginxproxy
  ];

  virtualisation.oci-containers.backend = "docker";
}
