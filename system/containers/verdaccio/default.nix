{
  imports = [
    ./certs.nix
  ];

  virtualisation.oci-containers.containers.verdaccio = {
    autoStart = true;
    image = "verdaccio/verdaccio";
    ports = ["4873:4873"];
    volumes = [
      "/etc/verdaccio/config.yaml:/verdaccio/conf/config.yaml"
      "conf:/verdaccio/conf"
      "storage:/verdaccio/storage"
      "plugins:/verdaccio/plugins"
    ];
    environment = {
      VIRTUAL_HOST = "npmjs.localhost";
    };
  };
  environment.etc."verdaccio/config.yaml" = {
    source = ./config.yaml;
  };
}
