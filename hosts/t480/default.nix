{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/desktop/niri.nix
    ../../modules/nixos/desktop/sddm.nix
    ../../modules/nixos/hardware/bluetooth.nix
    ../../modules/nixos/hardware/power.nix
    ../../modules/nixos/services/printing.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Hostname and networking
  networking.hostName = "t480";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Home Manager system integration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.vx = import ../../modules/home;
    startAsUserService = true;
    overwriteBackup = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit inputs;
    };
  };

  system.stateVersion = "25.11";
}
