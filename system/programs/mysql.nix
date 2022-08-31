{pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mysql80;
    settings = {
      mysqld = {
        default_authentication_plugin = "mysql_native_password";
      };
    };
  };
}
