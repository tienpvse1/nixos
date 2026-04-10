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
        height = 50;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "network"
          "bluetooth"
          "custom/temperature"
          "custom/memory"
          "battery"
          "backlight"
          "pulseaudio"
          "pulseaudio#microphone"
          "tray"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format-icons = {
            "1" = "😎";
            "2" = "🌐";
            "3" = "👩🏽‍💻";
            "4" = "📒";
            "5" = "🎵";
          };
          persistent_workspaces = {
            "*" = 1;
          };
        };

        "hyprland/window" = {
          format = "{}";
        };

        "custom/weather" = {
          tooltip = true;
          format = "{}";
          interval = 3600;
          exec = "~/.config/waybar/scripts/waybar-wttr.py";
          return-type = "json";
        };

        "custom/temperature" = {
          tooltip = true;
          format = " {}";
          interval = 30;
          exec = "cpu";
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

        "clock" = {
          format = "{: %I:%M %p  %a, %b %e}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>";
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
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 100;
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
          format-wifi = "  {signalStrength}%";
          format-ethernet = "{ipaddr}/{cidr}";
          tooltip-format = "{essid} - {ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}:{essid} {ipaddr}/{cidr}";
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
