{
  stdenv,
  lib,
  fetchurl,
  autoPatchelfHook,
  makeWrapper,
  libxkbcommon,
  libX11,
  libXext,
  libSM,
  libICE,
  libxcb,
  libXrender,
  libXfixes,
  libXi,
  fontconfig,
  freetype,
  dbus,
  udev,
  qt5,
  libXrandr,
  libusb1,
}:

stdenv.mkDerivation rec {
  pname = "huiontablet";
  version = "15.0.0.89";

  src = ./src/HuionTablet_v15.0.0.89.202205241352.x86_64.tar.xz;

  sourceRoot = ".";

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    qt5.qtbase
    qt5.qtsvg
    qt5.qtdeclarative
    qt5.qtquickcontrols2
    libxkbcommon
    libX11
    libXext
    libSM
    libICE
    libxcb
    libXrender
    libXfixes
    libXi
    fontconfig
    freetype
    dbus
    udev
    libXrandr
    libusb1
    qt5.qt3d
    qt5.qtgamepad
    qt5.qtxmlpatterns
    qt5.qtvirtualkeyboard
    qt5.qtremoteobjects
  ];

  qtWrapperArgs = [
    "--prefix QML2_IMPORT_PATH : $out/opt/huiontablet/huiontablet/qml"
    "--prefix QT_PLUGIN_PATH : $out/opt/huiontablet/huiontablet/platforms:$out/opt/huiontablet/huiontablet/imageformats"
  ];
  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mkdir -p $out/opt/huiontablet
    mkdir -p $out/share/applications
    mkdir -p $out/share/icons/hicolor/scalable/apps
    mkdir -p $out/lib/udev/rules.d

    cp -r huion/* $out/opt/huiontablet/

    cp ./install.sh $out/opt/huiontablet/
    cp ./uninstall.sh $out/opt/huiontablet/

    chmod +x $out/opt/huiontablet/huiontablet/huiontablet.sh
    chmod +x $out/opt/huiontablet/huiontablet/huionCore.sh
    chmod +x $out/opt/huiontablet/install.sh 
    chmod +x $out/opt/huiontablet/uninstall.sh 

    makeWrapper $out/opt/huiontablet/huiontablet/huiontablet.sh $out/bin/huiontablet-gui \
      --set QT_QPA_PLATFORMTHEME qt5ct \
      --prefix LD_LIBRARY_PATH : "$out/opt/huiontablet/huiontablet/libs" \
      --prefix PATH : "${lib.makeBinPath [ dbus ]}"

    makeWrapper $out/opt/huiontablet/huiontablet/huionCore.sh $out/bin/huiontablet-core \
      --prefix LD_LIBRARY_PATH : "$out/opt/huiontablet/huiontablet/libs"


    desktop_source_file=$out/opt/huiontablet/xdg/autostart/huiontablet.desktop
    desktop_target_file=$out/share/applications/huiontablet.desktop
    if [ -f "$desktop_source_file" ]; then
      cp "$desktop_source_file" "$desktop_target_file"
      sed -i "s|^Exec=.*|Exec=$out/bin/huiontablet-gui|" "$desktop_target_file"
      sed -i "s|^Icon=.*|Icon=huiontablet|" "$desktop_target_file"
    fi

    icon_source_file=$out/opt/huiontablet/icon/huiontablet.png
    if [ -f "$icon_source_file" ]; then
      cp "$icon_source_file" $out/share/icons/hicolor/scalable/apps/huiontablet.png
    fi


    udev_rules_file=$out/opt/huiontablet/huiontablet/res/rule/20-huion.rules
    if [ -f "$udev_rules_file" ]; then
      cp "$udev_rules_file" $out/lib/udev/rules.d/20-huion.rules
    fi

    runHook postInstall
  '';
  # meta = with stdenv.lib; {
  #   description = "Driver para tablets Huion";
  #   homepage = "https://www.huion.com";
  #   license = licenses.unfree;
  #   platforms = platforms.linux;
  #   maintainers = [ "viitorags" ];
  # };
}
