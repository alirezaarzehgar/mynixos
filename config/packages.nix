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
    xorg.xev

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
    gedit
    direnv
    nixfmt-classic
    haskell.compiler.ghc8107
    cabal-install
    texliveFull
    linuxdoc-tools
    nil

    telegram-desktop
    musikcube

    tor
    nekoray

    tree
    pfetch
    httrack
    cloc
    duf
    btop

    (pkgs.callPackage ./pkg/iflashc/package.nix { })
    (pkgs.callPackage ./pkg/git-llm/package.nix { })
  ];

  environment.sessionVariables = {
    TEXINPUTS = "${pkgs.linuxdoc-tools}//:";
  };
}
