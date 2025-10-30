{ pkgs, ... }:

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
    gopls
    git
    vim
    vscode
    wget
    firefox
    gcc
    gnumake
    gedit
    direnv
    nixfmt-classic
    haskell.compiler.ghc8107
    cabal-install
    texliveFull
    linuxdoc-tools
    poppler-utils
    nixd
    python3
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.virtualenv

    libvirt
    qemu
    docker
    redis

    telegram-desktop
    musikcube
    dunst

    tor
    nekoray

    fish
    tree
    pfetch
    httrack
    cloc
    duf
    btop
    k9s
    jq
    git-codereview
    qrencode
    pnglatex
    unzip
    envsubst

    (pkgs.callPackage ./pkg/iflashc/package.nix { })
    (pkgs.callPackage ./pkg/git-llm/package.nix { })
  ];

  environment.sessionVariables = { TEXINPUTS = "${pkgs.linuxdoc-tools}//:"; };
}
