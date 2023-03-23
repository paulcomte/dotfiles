{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
    copyKernels = true;
    gfxmodeEfi = "1920x1080";
  };

  boot.extraModprobeConfig = "options kvm_amd nested=1";

  boot.kernelParams = [ "nohibernate" ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/";

  boot.zfs.devNodes = "/dev/disk/by-uuid";

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.requestEncryptionCredentials = true;
}
