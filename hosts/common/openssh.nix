_: {
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    authorizedKeysInHomedir = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
