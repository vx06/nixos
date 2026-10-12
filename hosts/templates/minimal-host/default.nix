# Minimal NixOS Host Template
# To create a new host (e.g., "workstation" or "homeserver"):
# 1. Copy this folder to `hosts/<hostname>`:
#      cp -r hosts/templates/minimal-host hosts/<hostname>
# 2. Generate and place its hardware configuration:
#      nixos-generate-config --show-hardware-config > hosts/<hostname>/hardware-configuration.nix
# 3. Register the new machine in `flake.nix` under `nixosConfigurations.<hostname>`:
#      nixosConfigurations."<hostname>" = nixpkgs.lib.nixosSystem {
#        inherit system;
#        specialArgs = { inherit inputs; };
#        modules = [ ./hosts/<hostname> ];
#      };
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../common
    # Select optional NixOS modules as needed:
    # ../../modules/nixos/desktop/niri.nix
    # ../../modules/nixos/desktop/sddm.nix
    # ../../modules/nixos/hardware/bluetooth.nix
    # ../../modules/nixos/hardware/power.nix
    # ../../modules/nixos/services/printing.nix
  ];

  # Host identification
  networking.hostName = "minimal-host";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # State version of initial installation
  system.stateVersion = "25.11";
}
