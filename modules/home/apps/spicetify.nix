{
  pkgs,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];
  programs.spicetify = {
    enable = true;
    wayland = true;
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      marketplace
      lyricsPlus
      ncsVisualizer
    ];
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+
      aiBandBlocker
      listPlaylistsWithSong
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
