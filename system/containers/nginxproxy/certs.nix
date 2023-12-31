{
  environment.etc = {
    "certs/rootCA.crt" = {
      mode = "0644";
      text = ''
        -----BEGIN CERTIFICATE-----
        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
        gX0tTh6elHhIz5XLIr5qdu8wcKj7pxtMSA28
        -----END CERTIFICATE-----
      '';
    };
    "certs/rootCA.key" = {
      mode = "0600";
      text = ''
        -----BEGIN PRIVATE KEY-----
        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
        J78IYR36PgZdFRjfibTinXBIAINMk/g=
        -----END PRIVATE KEY-----
      '';
    };
  };
}
