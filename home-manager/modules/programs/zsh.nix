{ config, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases =
            let
                flakeDir = "~/nix";
            in {
            rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
            upd = "nix flake update ${flakeDir}";
            upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
            hms = "home-manager switch --flake ${flakeDir}";
            conf = "nvim ${flakeDir}/nixos/configuration.nix";
            pkgs = "nvim ${flakeDir}/nixos/modules/packages.nix";
            ls = "eza -ha --icons=auto --sort=name --group-directories-first";
            ll = "eza -lh --icons=auto";
            ff = "fastfetch";
        };
        
        initExtra = ''
            export PATH="$HOME/.cache/npm/global/bin:$PATH"
        '';

        
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "sudo" ];
            theme = "agnoster";
        };
    };
}
