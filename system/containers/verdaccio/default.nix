{
  imports = [
    ./certs.nix
  ];

  virtualisation.oci-containers.containers.verdaccio = {
    autoStart = true;
    image = "verdaccio/verdaccio";
    volumes = [
      "/etc/verdaccio/config.yaml:/verdaccio/conf/config.yaml"
      "verdaccio_conf:/verdaccio/conf"
      "verdaccio_storage:/verdaccio/storage"
      "verdaccio_plugins:/verdaccio/plugins"
    ];
    environment = {
      VIRTUAL_HOST = "npmjs.localhost";
      VIRTUAL_PORT = "4873";
    };
  };
  environment.etc."verdaccio/config.yaml" = {
    source = ./config.yaml;
  };
}
