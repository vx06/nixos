{ inputs, pkgs, ... }:
{
  imports = [
    ./nix.nix
    ./locale.nix
    ./audio.nix
    ./users.nix
    ./catppuccin.nix
    ./sops.nix
    ./openssh.nix
  ];

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
  };

  qt.enable = true;

  environment.systemPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.defaultPackages = [ ];
}
