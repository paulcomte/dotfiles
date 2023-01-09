{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    cmake
    git
    (hiPrio gcc)
    bintools-unwrapped
    maven
    gnumake
    tree
    ncurses
    which
    valgrind-light
    man-pages
  ];
}
