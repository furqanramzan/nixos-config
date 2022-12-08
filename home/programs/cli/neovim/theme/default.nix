{
  config,
  pkgs,
  ...
}: let
  vimThemeFromScheme = import ./plugin.nix {inherit pkgs;};
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = vimThemeFromScheme {scheme = config.colorscheme;};
      config = ''
        syntax enable
        colorscheme nix-${config.colorscheme.slug}
      '';
    }
  ];
}
