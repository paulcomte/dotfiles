{ config, pkgs, ... }:

{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    feh
    ranger
    pavucontrol # audio managerm
    direnv
    wget
    neofetch
    htop # utils
    # editors
    helix
    #rnix-lsp # nix lsp
    # password manager
    bitwarden
    # audio mixer
    pamixer
    # mullvad
    mullvad
    # torrent
    qbittorrent
    # video player
    vlc
    # VM
    virt-manager
    qemu
    libguestfs
    # Asus settings
    asusctl
    supergfxctl
    light
    xorg.xrandr
  ];

  fonts.packages = with pkgs; [
    anonymousPro
    unifont
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "UbuntuMono" ]; })
  ];

  fonts.enableDefaultPackages = false;

}
