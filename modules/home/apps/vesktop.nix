{ ... }:
{
  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      tray = true;
      minimizeToTray = false;
    };
    vencord.settings = {
      autoUpdate = true;
      notifyAboutUpdates = true;
      plugins = {
        FakeNitro.enabled = true;
        GameActivityToggle.enabled = true;
        CallTimer.enabled = true;
        SilentTyping.enabled = true;
        VolumeBooster.enabled = true;
        ReplaceGoogleSearch.enabled = true;
      };
    };
  };
}
