{ ... }:
{
  programs.obsidian = {
    enable = true;
    vaults = {
      obsidian = {
        enable = true;
        target = "Documents/obsidian";
      };
    };
    defaultSettings = {
      app = {
        pdfExportSettings = {
          includeName = true;
          pageSize = "A4";
          landscape = false;
          margin = 0;
          downscalePercent = 100;
        };
      };
    };
  };
}
