{
  pkgs,
  unstable,
  spicetify-nix,
  ...
}:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    spotifyPackage = unstable.spotify;
    spicetifyPackage = unstable.spicetify-cli;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      hidePodcasts
      popupLyrics
      lastfm
      playlistIcons
      keyboardShortcut
    ];

    theme = spicePkgs.themes.text;
    colorScheme = "Kanagawa";
  };
}
