{ inputs, ... }:
{
  # Systemwide sops-nix on each host
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ./common.yaml;
}
