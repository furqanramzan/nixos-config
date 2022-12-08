{
  imports = [
    ./certs.nix
  ];

  virtualisation.oci-containers.containers.nginxproxy = {
    autoStart = true;
    image = "jwilder/nginx-proxy:alpine";
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
