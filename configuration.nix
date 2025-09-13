{
  imports = [ ./packages.nix ];

  boot.loader.grub.device = "/dev/sda";

  time.timeZone = "Asia/Tehran";

  users.users.ali = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;

    windowManager.i3.enable = true;
    desktopManager.gnome.enable = true;

    xkb.layout = "us,ir";
    xkb.options = "grp:alt_shift_toggle";

    windowManager.i3.configFile = ./i3/config;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  services.tor = {
    enable = true;
    client.enable = true;
  };

  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
    fadeDelta = 4;
    inactiveOpacity = 0.8;
    activeOpacity = 1;
    opacityRules = [ "95:class_g = 'Gnome-terminal'" ];

    settings.blur = {
      method = "dual_kawase";
      background = true;
      strength = 5;
    };
  };

  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };

  virtualisation.docker.enable = true;
}
