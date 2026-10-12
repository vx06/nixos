{ config, inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    cache.enable = false;
    firefox.force = true;
    vesktop.enable = true;
    vscode.profiles.default.enable = true;
    anki.enable = true;
    cursors = {
      enable = config.wayland.windowManager.niri.enable;
      accent = "dark";
    };
  };

  home.pointerCursor.enable = true;

  gtk = {
    enable = true;
    colorScheme = "dark";
  };

  qt = {
    enable = true;
    style.name = "kvantum";
  };

  fonts.fontconfig = {
    enable = true;
  };
}
