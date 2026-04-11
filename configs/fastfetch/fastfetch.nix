{ ... }: {
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "builtin";
        source = "nixos";
        color = {
          "1" = "#cba6f7";
          "2" = "#89b4fa";
        };
      };

      display = {
        separator = " : ";
        color = {
          keys = "#cba6f7";
          title = "#89b4fa";
        };
      };

      modules = [
        "title"

        {
          type = "custom";
          format = "";
        }

        { type = "os"; key = "OS     "; }
        { type = "kernel"; key = "Kernel "; }
        { type = "uptime"; key = "Uptime "; }
        { type = "packages"; key = "Pkgs   "; }

        {
          type = "custom";
          format = "";
        }

        { type = "wm"; key = "WM     "; }
        { type = "shell"; key = "Shell  "; }
        { type = "terminal"; key = "Term   "; }

        {
          type = "custom";
          format = "";
        }

        { type = "cpu"; key = "CPU    "; }
        { type = "memory"; key = "Memory "; }
      ];
    };
  };
}
