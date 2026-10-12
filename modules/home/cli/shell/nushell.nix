{
  pkgs,
  lib,
  ...
}:
{
  programs.carapace.enable = true;
  programs.bash.enable = true;

  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      formats
      gstat
      polars
      query
    ];
    settings = {
      show_banner = false;
      edit_mode = "vi";
    };
    configFile.text =
      lib.concatLines
      <| map (cmd: "use ${pkgs.nu_scripts}/share/nu_scripts/aliases/${cmd}/${cmd}-aliases.nu *") [
        "bat"
        "docker"
        "git"
      ];
  };
}
