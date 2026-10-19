_:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [ proton-ge-bin ];
  };
}