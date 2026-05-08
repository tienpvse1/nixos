{pkgs, ...} : {
  home.file.".copilot/config.json" = {
    text = builtins.toJSON {
        # Your existing settings
        "firstLaunchAt" = "2026-04-17T06:54:02.317Z";
        "banner" = "never";
        "mcpServers" = {
          "honeycomb" = {
            "command" = "${pkgs.nodejs_24}/bin/npx";
            "args" = [ "-y" "@honeycombio/mcp-server" ];
            "env" = {
              "HONEYCOMB_API_KEY" = builtins.getEnv "HONEYCOMB_KEY";
            };
          };
        };
      };
    force = true;
  };
}
