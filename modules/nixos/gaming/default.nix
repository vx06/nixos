{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamemode.enable = true;
}