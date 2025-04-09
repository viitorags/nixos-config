{ config, lib, pkgs, ... }:

let
  buildTheme = { name, version, src, themeIni ? [] }:
    pkgs.stdenv.mkDerivation rec {
      pname = "sddm-theme-${name}";
      inherit version src;
      buildCommand = ''
          mkdir -p $TMPDIR/theme
          if [ -d $src/${name} ]; then
            srcDir=$src/${name}
          else
            srcDir=$src
          fi
          cp -r $srcDir/* $TMPDIR/theme/

          # Edita o theme.conf no TMPDIR
          chmod u+w $TMPDIR/theme/theme.conf || true

          ${lib.concatMapStringsSep "\n" (e: ''
            ${pkgs.crudini}/bin/crudini --set --inplace $TMPDIR/theme/theme.conf \
              "${e.section}" "${e.key}" "${e.value}"
          '') themeIni}

          # Separa arquivos de documentação
          mkdir -p $TMPDIR/doc
          for f in $TMPDIR/theme/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
            test -f $f && mv $f $TMPDIR/doc/
          done

          # Agora copia tudo para $out
          dir=$out/share/sddm/themes/${name}
          doc=$out/share/doc/${pname}
          mkdir -p $dir $doc
          cp -r $TMPDIR/theme/* $dir/
          cp -r $TMPDIR/doc/* $doc/ || true        
      ''; 
    };

  theme = themes.sugar-candy;

  customTheme = builtins.isAttrs theme;

  themeName = if customTheme
    then theme.pkg.name
    else theme;

  packages = if customTheme
    then [ (buildTheme theme.pkg) ] ++ theme.deps
    else [];

  themes = {
    sugar-candy = {
      pkg = rec {
        name = "sugar-candy";
        version = "1.6";
        src = pkgs.fetchFromGitHub {
          owner = "Kangie";
          repo = "sddm-sugar-candy";
          rev = "v1.6";
          sha256 = "18wsl2p9zdq2jdmvxl4r56lir530n73z9skgd7dssgq18lipnrx7";
        };
        themeIni = [
            { section = "General"; key = "background"; value = ./sddm-backgrounds/ALLqk82.png;}
        ];
      };
      deps = with pkgs; [ 
        libsForQt5.qt5.qtgraphicaleffects 
        libsForQt5.qt5.qtquickcontrols2
      ];
    };
  };
in
{
  environment.systemPackages = packages;
}
