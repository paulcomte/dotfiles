{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
  };

  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "fr";
  };


  environment.etc."supergfxd.conf" = {
    mode = "0644";
    source = (pkgs.formats.json { }).generate "supergfxd.conf" {
      mode = "Integrated";
      vfio_enable = true;
      vfio_save = false;
      always_reboot = false;
      no_logind = true;
      logout_timeout_s = 180;
      hotplug_type = "Asus";
    };
  };

  systemd.services.supergfxd.path = [ pkgs.kmod pkgs.pciutils ];
}
