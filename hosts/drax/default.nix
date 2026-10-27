{ inputs, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/desktop/niri.nix
    ../../modules/nixos/desktop/sddm.nix
    ../../modules/nixos/hardware/bluetooth.nix
    ../../modules/nixos/hardware/power.nix
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/services/printing.nix
    ../../modules/nixos/gaming
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "drax";
  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openvpn
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.plymouth.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.vx.imports = [
      ../../modules/home
      ../../modules/home/apps
      ../../modules/home/art
      ../../modules/home/cli
      ../../modules/home/communication
      ../../modules/home/desktop
      ../../modules/home/gaming
      ../../modules/home/media
      ../../modules/home/productivity
      ../../modules/home/secrets/sops.nix
      ./home.nix
    ];
    startAsUserService = true;
    overwriteBackup = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit inputs;
    };
  };

  system.stateVersion = "26.05";
}
