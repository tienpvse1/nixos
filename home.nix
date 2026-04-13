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
    ./configs/fastfetch/fastfetch.nix
    ./configs/starship/starship.nix
    inputs.zen-browser.homeModules.beta
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  services = {
    playerctld.enable = true;
    hyprpaper = {
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
      settings = {
         background_opacity = "0.7";
         background_blur = "1";
         dynamic_background_opacity = "yes";
      };
      font = {
        name = "Fira Code";
      };
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
      bun
      pulumi
      openssl
      telegram-desktop
      libnotify
      pamixer
      jq
      fzf
      ytmdesktop
      brightnessctl
    ];
    stateVersion = "25.11";
  };
  home.sessionVariables = {
    SST_BUN_PATH = "/home/tienpvse/.nix-profile/bin/bun";
    SST_PULUMI_PATH = "/home/tienpvse/.nix-profile/bin/pulumi";
  };
  fonts.fontconfig.enable = true;
}
