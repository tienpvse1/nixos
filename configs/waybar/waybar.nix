{ pkgs, ... }:

{
  imports = [
    ./waybar-style.nix
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 35;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "network"
          "bluetooth"
          "custom/notification"
          "pulseaudio"
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          persistent_workspaces = {
            "*" = 4;
          };
        };

        "hyprland/window" = {
          # {initialTitle} usually contains the app name (e.g., "Firefox") 
          # rather than the full tab title.
          format = "{initialTitle}";
          
          # This section cleans up specific apps that might still be messy
          rewrite = {
            "(.*) — Mozilla Firefox" = "Firefox";
            "(.*) - Visual Studio Code" = "VS Code";
            "(.*) - Discord" = "Discord";
            "kitty" = "Kitty";
            "Google Antigravity" = "Antigravity"; # Targeted for your specific setup
          };

          # Optional: Prevents the bar from jumping around if an app has a long name
          max-length = 50;
          separate-outputs = true;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{} {icon}";
          "format-icons" = {
            notification = "󱅫";
            none = "";
            "dnd-notification" = " ";
            "dnd-none" = "󰂛";
            "inhibited-notification" = " ";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = " ";
            "dnd-inhibited-none" = " ";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          exec = "swaync-client -swb";
          "on-click" = "sleep 0.1 && swaync-client -t -sw";
          "on-click-right" = "sleep 0.1 && swaync-client -d -sw";
          escape = true;
        };

        "custom/memory" = {
          tooltip = true;
          format = "🧠 {}";
          interval = 30;
          exec = "memory";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
          on-scroll-up = "brightnessctl -q set 1%+";
          on-scroll-down = "brightnessctl -q set 1%-";
        };

        "battery" = {
          states = {
            good = 95;
            warning = 40;
            critical = 30;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
        };
        "clock"= {
            "interval"= 60;
            "format"= "{:%H:%M}";
            "max-length"= 25;
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };

        "network" = {
          format-ethernet = "{ipaddr}/{cidr}";
          tooltip-format = "{essid} - {ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{essid} - {signalStrength}%";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-wifi= "{icon}";
        };

        "bluetooth" = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections}";
          tooltip-format = "{device_alias}";
          tooltip-format-connected = " {device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
        };
      };
    };
  };
}
