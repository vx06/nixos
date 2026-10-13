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
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "drax";
  networking.networkmanager.enable = true;

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
  };
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.vx.imports = [
      ../../modules/home
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
