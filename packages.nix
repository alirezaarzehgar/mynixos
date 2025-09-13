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
    nixd

    libvirt
    qemu
    docker
    redis

    telegram-desktop
    musikcube

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

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        golang.go
      ];
    })

    (pkgs.callPackage ./pkg/iflashc/package.nix { })
    (pkgs.callPackage ./pkg/git-llm/package.nix { })
  ];

  environment.sessionVariables = { TEXINPUTS = "${pkgs.linuxdoc-tools}//:"; };
}
