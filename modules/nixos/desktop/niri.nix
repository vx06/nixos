{ ... }:
{
  programs.niri.enable = true;

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];
}
