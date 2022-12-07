{configs, ...}: let
  inherit (configs) homeDirectory;
in {
  imports = [
    ./certs.nix
  ];

  virtualisation.oci-containers.containers.nginxproxy = {
    autoStart = true;
    image = "jwilder/nginx-proxy";
    ports = [
      "80:80"
      "443:443"
    ];
    volumes = [
      "/etc/certs:/etc/nginx/certs"
      "/var/run/docker.sock:/tmp/docker.sock:ro"
    ];
  };
}
