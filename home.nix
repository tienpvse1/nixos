{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home.enableNixpkgsReleaseCheck = false;
  imports = [
    ./configs/i18n.nix
    ./configs/waybar/waybar.nix
    ./configs/hyprland/hyprland.nix
    ./configs/nvim/nvim.nix
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  services.swaync.enable = true;
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${./wallpapers/dracula.png}"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "${./wallpapers/dracula.png}";
        }
      ];
    };
  };
  programs = {
    rofi.enable = true;
    bat.enable = true;
    hyprshot.enable = true;
    hyprlock.enable = true;
    kitty = {
      enable = true;
      font = {
        name = "Fira Code";
      };
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch -I ~/dotfiles/configuration.nix";
      };
      history.size = 10000;
      oh-my-zsh = {
        # "ohMyZsh" without Home Manager
        enable = true;
        plugins = [
          "git"
          "thefuck"
        ];
        theme = "robbyrussell";
      };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
  home = {

    username = "tienpvse";
    homeDirectory = "/home/tienpvse";
    packages = with pkgs; [
      nodejs_24
      pnpm_10
      inputs.antigravity-nix.packages.x86_64-linux.default
      xclip
      font-awesome
      nixfmt
      hyprpaper
      btop
      nwg-look
      gcc
      ripgrep
      fd
    ];
    stateVersion = "25.11";
  };
  fonts.fontconfig.enable = true;
}
