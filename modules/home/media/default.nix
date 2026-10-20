{ pkgs, inputs, ... }:
{
  imports = [
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    jellyfin-desktop
    inputs.subtui.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.mpv.enable = true;
  programs.prismlauncher.enable = true;
}