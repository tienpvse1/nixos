{ pkgs, ... } : {

  programs.pay-respects = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch -I ~/dotfiles/configuration.nix";
      };
      initContent = ''
        if [[ -o interactive ]] && [[ -z "$TMUX" ]] && [[ -z "$SSH_CONNECTION" ]]; then
          fastfetch
        fi
      '';
      history.size = 10000;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
        theme = "robbyrussell";
      };
  };
}
