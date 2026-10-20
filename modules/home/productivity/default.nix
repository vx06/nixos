{ pkgs, ... }:
{
  imports = [
    ./anki.nix
    ./obsidian.nix
  ];

  home.packages = with pkgs; [
    remnote
  ];
}