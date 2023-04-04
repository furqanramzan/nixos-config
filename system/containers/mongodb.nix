{
  virtualisation.oci-containers.containers.mongodb = {
    autoStart = true;
    image = "mongo:6.0.5";
    ports = [
      "27017:27017"
    ];
    environment = {
      MONGO_INITDB_ROOT_USERNAME = "root";
      MONGO_INITDB_ROOT_PASSWORD = "root";
      ME_CONFIG_MONGODB_URL = "mongodb://root:root@mongo:27017/";
    };
  };
}
