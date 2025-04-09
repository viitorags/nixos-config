{ stdenv, fetchFromGitHub }: {
        
    kvantum-gruvbox = stdenv.mkDerivation rec {
        pname = "kvantum-gruvbox";
        version = "1.1";
        dontBuild = true;
        src = fetchFromGitHub {
            owner = "TheExacc";
            repo = "Gruvbox-Kvantum";
            rev = "v1.1";
            sha256 = "1z5vz7ngy8rkm4idcja0i8jz2yi84b5qfdz2fxp5pklfg0vnlsxp";
        };
        installPhase = ''
            mkdir -p $out/share/Kvantum
            cp -aR $src $out/share/Kvantum/gruvbox-kvantum
        '';
    };
}
