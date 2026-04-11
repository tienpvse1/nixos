{pkgs, ...} : {
  home.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -alF --color=auto";
    la = "ls -A --color=auto";
    l = "ls -CF --color=auto";
  };
}
