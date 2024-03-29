{ config, pkgs, ... }:

{

  virtualisation.libvirtd.enable = true;

  services = {
    logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
      HandleLidSwitch=ignore
    '';

    blueman.enable = true;
    envfs.enable = true;

    zfs.trim.enable = true;
    zfs.autoSnapshot.enable = true;
    zfs.autoScrub.enable = true;
    mullvad-vpn.enable = true;
    asusd.enable = true;
    supergfxd.enable = true;

    usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
    };

    xserver = {
      enable = true;
      xkb.layout = "fr";
      libinput.enable = true;

      videoDrivers = [ "nvidia" ];

      desktopManager.lumina.enable = true;

      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
        #sddm.enable = true;
        defaultSession = "hyprland";
      };

    };

    openssh.enable = true;
    vnstat.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };

}
