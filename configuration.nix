{ config, pkgs, lib, ... }:
{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix 
    ];
    virtualisation.docker = {
      enable = true;
    };
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # see the note above
  networking.extraHosts =
  ''
  10.32.100.72 api.lisbon-alteos.com
  127.0.0.1 local.dev.dash.amili.asia
  127.0.0.1 local.app.sandbox.amili.asia
  '';
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  services.getty.autologinUser = "tienpvse";
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    wireplumber.extraConfig."11-bluetooth-policy" = {
      "wireplumber.settings" = {
        "bluetooth.autoswitch-to-headset-profile" = false;
      };
    };
  };
  services.blueman.enable = true;
  programs.zsh.enable = true;
  users.users.tienpvse = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "tienpvse";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    ];
  };
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "beekeeper-studio-5.3.4"
  ];

  environment.systemPackages = with pkgs; [
    neovim 
    wget
    git
    gh
    slack
    home-manager
    nh
    postman
    vscode
    beekeeper-studio
    opencv 
    go
    pkg-config
    pulseaudio
    pavucontrol
    bluez
    bluez-tools
  ];
  fonts.packages = with pkgs; [ nerd-fonts.fira-code ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password-cli"
    "1password-gui"
    "1password"
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "tienpvse" ];
  };

  system.stateVersion = "25.11";

}
