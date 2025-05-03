{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["ehci_pci" "ahci" "firewire_ohci" "xhci_pci" "usb_storage" "sd_mod" "sr_mod" "sdhci_pci"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/cc3c674a-e6fb-428c-9ce4-64e1b1e0c913";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/26c63605-5315-4084-bf10-2ace90f655da";}
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libglvnd
      vaapiIntel
      libvdpau-va-gl
      intel-media-driver
      vulkan-loader
      libva
    ];
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
