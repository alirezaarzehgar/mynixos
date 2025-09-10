{ config, lib, pkgs, modulesPath, ... }:

{
  environment.systemPackages = with pkgs; [
    dmenu
    i3
    i3lock
    i3status
    gnome-terminal
    feh
    picom
    flameshot
    pamixer

    go
    git
    vim
    wget
    firefox
    fish
    gcc
    gnumake
    docker
    k9s
    vscode
    direnv
    nixfmt-classic
    haskell.compiler.ghc8107

    telegram-desktop
    musikcube

    tor
    nekoray

    tree
    pfetch
    httrack

    (pkgs.callPackage ./pkg/iflashc-bin/package.nix { })
  ];
}
