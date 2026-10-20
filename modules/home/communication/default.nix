{ pkgs, ... }:
{
  imports = [
    ./vesktop.nix
  ];

  home.packages = with pkgs; [
    signal-desktop
    simplex-chat-desktop
    # mumble # 1.5.915 failed to build
  ];
  
}