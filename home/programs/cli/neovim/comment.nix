{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/numtostr/comment.nvim/
    {
      plugin = comment-nvim;
      type = "lua";
      config = ''
        require('Comment').setup {}
      '';
    }
  ];
}
