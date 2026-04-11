{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk-dark.css";
  };
  xdg.configFile."gtk-3.0/settings.ini".force = true;
  xdg.configFile."gtk-4.0/settings.ini".force = true;
}
