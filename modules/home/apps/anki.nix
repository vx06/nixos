{ config, ... }:
{
  sops.secrets = {
    "anki/user" = {
      sopsFile = ../../../secrets/anki.yaml;
    };
    "anki/key" = {
      sopsFile = ../../../secrets/anki.yaml;
    };
  };

  programs.anki = {
    enable = true;
    theme = "dark";
    profiles.${config.home.username} = {
      default = true;
      sync = {
        autoSync = true;
        syncMedia = true;
        url = "https://anki.moneten.cc";
        keyFile = config.sops.secrets."anki/key".path;
        usernameFile = config.sops.secrets."anki/user".path;
      };
    };
  };
}
