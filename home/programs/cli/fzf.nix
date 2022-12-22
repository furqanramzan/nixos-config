{
  pkgs,
  config,
  ...
}: let
  inherit (config.colorscheme) colors;
in {
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    changeDirWidgetOptions = [
      "--preview 'tree -C {} | head -200'"
    ];
    defaultOptions = [
      "--height 80%"
      "--border"
      "--reverse"
    ];
    fileWidgetOptions = [
      "--preview 'bat --style=numbers --color=always --line-range :500 {}'"
    ];
    historyWidgetOptions = [
      "--sort"
      "--exact"
    ];
    tmux = {
      enableShellIntegration = true;
    };
  };
  home.packages = with pkgs; [tree];
}
