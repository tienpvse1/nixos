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
    awscli = {
      enable = true;
      settings = {
        "profile amili-tienpvse-dev" = {
          sso_session = "amili-tienpvse-dev";
          sso_account_id = "705030229210";
          sso_role_name = "v2-amili-dev-developer";
          region = "ap-southeast-1";
        };

        "sso-session amili-tienpvse-dev" = {
          sso_start_url = "https://amili-sso.awsapps.com/start/";
          sso_region = "ap-southeast-1";
          sso_registration_scopes = "sso:account:access";
        };

        "profile amili-tienpvse-prod" = {
          sso_session = "amili-tienpvse-prod";
          sso_account_id = "412868562714";
          sso_role_name = "v2-amili-prod-pe";
          region = "ap-southeast-1";
        };

        "sso-session amili-tienpvse-prod" = {
          sso_start_url = "https://amili-sso.awsapps.com/start/";
          sso_region = "ap-southeast-1";
          sso_registration_scopes = "sso:account:access";
        };
      };
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
      openssl
      telegram-desktop
      libnotify
    ];
    stateVersion = "25.11";
  };
  fonts.fontconfig.enable = true;
}
