{
  inputs,
  ...
}:
{
  home = {
    username = "vx";
    homeDirectory = "/home/vx";
    stateVersion = "26.05";
    shellAliases = {
      c = "clear";
      ff = "fastfetch";
    };
  };

  xdg = {
    enable = true;
    autostart.enable = true;
    mime.enable = true;
    mimeApps.enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
