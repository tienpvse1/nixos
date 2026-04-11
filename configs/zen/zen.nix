{pkgs, ...} : {
  programs.zen-browser = {
    enable = true;
    profiles.default = {
      spacesForce = true; 
      keyboardShortcuts = [
      {
        id = "zen-workspace-switch-1";
        key = "1";
        modifiers = {
          control = true;
        };
      }
      {
        id = "zen-workspace-switch-2";
        key = "2";
        modifiers = {
          control = true;
        };
      }
      {
        id = "zen-workspace-switch-3";
        key = "3";
        modifiers = {
          control = true;
        };          
      }
      ];
      spaces = {
        "Personal" = {
          id = "a1b2c3d4-e5f6-4a5b-8c9d-0123456789ab";
          position = 1;
          icon = "🎮";
          container = 1; 
        };

        "Alteos" = {
          id = "7f748074-6f94-46c0-9d0a-9951307d069b"; 
          position = 2;
          icon = "😇"; 
          container = 2; 
        };
        "Amili" = {
          id = "7f748074-6f94-46c0-9d0a-9951307d068c"; 
          position = 3;
          icon = "🐛"; 
          container = 3; 
        };
      };
    };
  };
}
