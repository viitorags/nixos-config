{ config, pkgs, ... }: {
    programs.ranger = {
        enable = true;
        mappings = {
            e = "edit";
            ec = "compress";
            ex = "extract";
            b = "fzm";
            D = "delete";
            mk = "mkdir";
        };

        settings = {
            preview_images = true;
            preview_images_method = "kitty";
            draw_borders = true;
            w3m_delay = 0;
        };
           
        rifle = [
            # Websites
            { condition = "ext x?html?, has surf, X"; command = "surf -- file://\"$1\""; }
            { condition = "ext x?html?, has vimprobable, X"; command = "vimprobable -- \"$@\""; }
            { condition = "ext x?html?, has vimprobable2, X"; command = "vimprobable2 -- \"$@\""; }
            { condition = "ext x?html?, has qutebrowser, X"; command = "qutebrowser -- \"$@\""; }
            { condition = "ext x?html?, has dwb, X"; command = "dwb -- \"$@\""; }
            { condition = "ext x?html?, has jumanji, X"; command = "jumanji -- \"$@\""; }
            { condition = "ext x?html?, has luakit, X"; command = "luakit -- \"$@\""; }
            { condition = "ext x?html?, has uzbl, X"; command = "uzbl -- \"$@\""; }
            { condition = "ext x?html?, has uzbl-tabbed, X"; command = "uzbl-tabbed -- \"$@\""; }
            { condition = "ext x?html?, has uzbl-browser, X"; command = "uzbl-browser -- \"$@\""; }
            { condition = "ext x?html?, has uzbl-core, X"; command = "uzbl-core -- \"$@\""; }
            { condition = "ext x?html?, has midori, X"; command = "midori -- \"$@\""; }
            { condition = "ext x?html?, has opera, X"; command = "opera -- \"$@\""; }
            { condition = "ext x?html?, has firefox, X"; command = "firefox -- \"$@\""; }
            { condition = "ext x?html?, has seamonkey, X"; command = "seamonkey -- \"$@\""; }
            { condition = "ext x?html?, has iceweasel, X"; command = "iceweasel -- \"$@\""; }
            { condition = "ext x?html?, has chromium-browser, X"; command = "chromium-browser -- \"$@\""; }
            { condition = "ext x?html?, has chromium, X"; command = "chromium -- \"$@\""; }
            { condition = "ext x?html?, has google-chrome, X"; command = "google-chrome -- \"$@\""; }
            { condition = "ext x?html?, has epiphany, X"; command = "epiphany -- \"$@\""; }
            { condition = "ext x?html?, has konqueror, X"; command = "konqueror -- \"$@\""; }
            { condition = "ext x?html?, has elinks, terminal"; command = "elinks \"$@\""; }
            { condition = "ext x?html?, has links2, terminal"; command = "links2 \"$@\""; }
            { condition = "ext x?html?, has links, terminal"; command = "links \"$@\""; }
            { condition = "ext x?html?, has lynx, terminal"; command = "lynx -- \"$@\""; }
            { condition = "ext x?html?, has w3m, terminal"; command = "w3m \"$@\""; }

            # Misc
            { condition = "mime ^text"; command = "nvim -- \"$@\""; }
            { condition = "mime ^text"; command = "$PAGER -- \"$@\""; }
            { condition = "!mime ^text, label editor, ext xml|json|csv|tex|py|pl|rb|rs|js|sh|php|dart|nim|lua"; command = "nvim -- \"$@\""; }
            { condition = "!mime ^text, label pager, ext xml|json|csv|tex|py|pl|rb|rs|js|sh|php|dart|nim|lua"; command = "$PAGER -- \"$@\""; }
            { condition = "ext 1"; command = "man \"$1\""; }
            { condition = "ext s[wmf]c, has zsnes, X"; command = "zsnes \"$1\""; }
            { condition = "ext s[wmf]c, has snes9x-gtk, X"; command = "snes9x-gtk \"$1\""; }
            { condition = "ext nes, has fceux, X"; command = "fceux \"$1\""; }
            { condition = "ext exe, has wine"; command = "wine \"$1\""; }
            { condition = "ext nim, has nim"; command = "nim r -- \"$1\""; }
            { condition = "name ^[mM]akefile$"; command = "make"; }
                
            # Scripts
            { condition = "ext py"; command = "python -- \"$1\""; }
            { condition = "ext pl"; command = "perl -- \"$1\""; }
            { condition = "ext rb"; command = "ruby -- \"$1\""; }
            { condition = "ext js"; command = "node -- \"$1\""; }
            { condition = "ext sh"; command = "sh -- \"$1\""; }
            { condition = "ext php"; command = "php -- \"$1\""; }
            { condition = "ext dart"; command = "dart run -- \"$1\""; }
            # Audio without X
            { condition = "mime ^audio|ogg$, terminal, has mpv"; command = "mpv -- \"$@\""; }
            { condition = "mime ^audio|ogg$, terminal, has mplayer2"; command = "mplayer2 -- \"$@\""; }
            { condition = "mime ^audio|ogg$, terminal, has mplayer"; command = "mplayer -- \"$@\""; }
            { condition = "ext midi?, terminal, has wildmidi"; command = "wildmidi -- \"$@\""; }

            # Video/Audio with a GUI
            { condition = "mime ^video|^audio, has gmplayer, X, flag f"; command = "gmplayer -- \"$@\""; }
            { condition = "mime ^video|^audio, has smplayer, X, flag f"; command = "smplayer \"$@\""; }
            { condition = "mime ^video, has iina, X, flag f"; command = "iina -- \"$@\""; }
            { condition = "mime ^video|^audio, has iina, X, flag f"; command = "iina --music-mode -- \"$@\""; }
            { condition = "mime ^video, has mpv, X, flag f"; command = "mpv -- \"$@\""; }
            { condition = "mime ^video, has mpv, X, flag f"; command = "mpv --fs -- \"$@\""; }
            { condition = "mime ^video, has mplayer2, X, flag f"; command = "mplayer2 -- \"$@\""; }
            { condition = "mime ^video, has mplayer2, X, flag f"; command = "mplayer2 -fs -- \"$@\""; }
            { condition = "mime ^video, has mplayer, X, flag f"; command = "mplayer -- \"$@\""; }
            { condition = "mime ^video, has mplayer, X, flag f"; command = "mplayer -fs -- \"$@\""; }
            { condition = "mime ^video|^audio, has vlc, X, flag f"; command = "vlc -- \"$@\""; }
            { condition = "mime ^video|^audio, has totem, X, flag f"; command = "totem -- \"$@\""; }
            { condition = "mime ^video|^audio, has totem, X, flag f"; command = "totem --fullscreen -- \"$@\""; }
            { condition = "mime ^audio, has audacity, X, flag f"; command = "audacity -- \"$@\""; }
            { condition = "ext aup, has audacity, X, flag f"; command = "audacity -- \"$@\""; }

            # Video without X
            { condition = "mime ^video, terminal, !X, has mpv"; command = "mpv -- \"$@\""; }
            { condition = "mime ^video, terminal, !X, has mplayer2"; command = "mplayer2 -- \"$@\""; }
            { condition = "mime ^video, terminal, !X, has mplayer"; command = "mplayer -- \"$@\""; }

            # Documents
            { condition = "ext pdf, has llpp, X, flag f"; command = "llpp \"$@\""; }
            { condition = "ext pdf, has zathura, X, flag f"; command = "zathura -- \"$@\""; }
            { condition = "ext pdf, has mupdf, X, flag f"; command = "mupdf \"$@\""; }
            { condition = "ext pdf, has mupdf-x11, X, flag f"; command = "mupdf-x11 \"$@\""; }
            { condition = "ext pdf, has apvlv, X, flag f"; command = "apvlv \"$@\""; }
            { condition = "ext pdf, has okular, X, flag f"; command = "okular -- \"$@\""; }
            { condition = "ext pdf, has evince, X, flag f"; command = "evince -- \"$@\""; }
            { condition = "ext pdf, has atril, X, flag f"; command = "atril -- \"$@\""; }
            { condition = "ext pdf, has atril, X, flag f"; command = "atril --fullscreen -- \"$@\""; }
            
            # Images
            { condition = "mime ^image"; command = "feh -Z -F \"$@\""; }
                    
        ];

        extraConfig = ''
            default_linemode devicons2
        '';

        plugins = [
            {
                name = "ranger-devicons2";
                src = builtins.fetchGit {
                    url = "https://github.com/cdump/ranger-devicons2";
                    ref = "master";
                    rev = "94bdcc19218681debb252475fd9d11cfd274d9b1";
                };
            }
        ];
    };
}
