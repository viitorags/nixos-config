{
  lib,
  stdenv,
  coreutils,
  fetchFromGitLab,
}:
stdenv.mkDerivation rec {
  pname = "pokemon-colorscripts";
  version = "2024-10-19-8fab453";

  src = fetchFromGitLab {
    owner = "phoneybadger";
    repo = "pokemon-colorscripts";
    rev = "8fab453f15eeb20cbae61e297698e2a892a690b9";
    sha256 = "19bybxbdid0xf92sz4w8i0rcjf0xr0v0yjrchnbjvvddfaj6d9c0";
  };

  buildInputs = [ coreutils ];

  preBuild = ''
    patchShebangs ./install.sh

    # Fix hardcoded prefixed coreutils
    substituteInPlace pokemon-colorscripts.sh --replace greadlink readlink
    substituteInPlace pokemon-colorscripts.sh --replace gshuf shuf

    substituteInPlace install.sh --replace /usr/local $out
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt
    mkdir -p $out/bin
    ./install.sh

    runHook postInstall
  '';
}
