{
  pkgs,
  spicetify-nix,
  unstable,
  ...
}:
{
  programs.spicetify =
    let
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      spotifyPackage = unstable.spotify;
      spicetifyPackage = unstable.spicetify-cli;
      experimentalFeatures = true;
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        hidePodcasts
        #shuffle # shuffle+ (special characters are sanitized out of extension names)
        popupLyrics
        lastfm
        playlistIcons
        keyboardShortcut
      ];

      theme = spicePkgs.themes.text;
      colorScheme = "Gruvbox";
    };
}
