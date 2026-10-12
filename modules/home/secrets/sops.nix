{ config, inputs, ... }:
{
  # sops-nix homemanager module for the user
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops.age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
}
