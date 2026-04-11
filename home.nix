{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home.enableNixpkgsReleaseCheck = false;
  imports = [
    ./configs/fcitx5/fcitx5.nix
    ./configs/waybar/waybar.nix
    ./configs/hyprland/hyprland.nix
    ./configs/nvim/nvim.nix
    ./configs/swaync/swaync.nix
    ./configs/rofi/rofi.nix
    ./configs/zen/zen.nix
    ./configs/aws/awscli.nix
    ./configs/gtk.nix
    ./configs/zsh/zsh.nix
    inputs.zen-browser.homeModules.beta
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
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
    bun.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd" 
      ];
    };
    bat.enable = true;
    hyprshot.enable = true;
    hyprlock.enable = true;
    kitty = {
      enable = true;
      font = {
        name = "Fira Code";
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
      openssl
      telegram-desktop
      libnotify
      pamixer
      jq
      fzf
    ];
    stateVersion = "25.11";
  };
  fonts.fontconfig.enable = true;
}
