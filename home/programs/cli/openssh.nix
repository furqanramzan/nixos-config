{
  home.file = {
    ".ssh/config" = {
      text = ''
        HostKeyAlgorithms +ssh-rsa
        PubkeyAcceptedAlgorithms +ssh-rsa
      '';
    };
  };
}
