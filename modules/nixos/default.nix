{ ... }:
{
  imports = [
    ./desktop/niri.nix
    ./desktop/sddm.nix
    ./hardware/bluetooth.nix
    ./hardware/power.nix
    ./services/printing.nix
  ];
}
