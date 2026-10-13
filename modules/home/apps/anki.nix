{ config, ... }:
let 
  sopsFile = ../../../secrets/anki.yaml;
in 
{
  sops.secrets = {
    "anki/user" = { inherit sopsFile; };
    "anki/key" = { inherit sopsFile; };
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
