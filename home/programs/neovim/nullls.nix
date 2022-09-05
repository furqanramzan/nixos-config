{pkgs, ...}: {
  home.packages = with pkgs; [
    # Bash
    shfmt
    # Go
    gopls
    # Javascript, Typescript, JSX, TSX
    nodePackages_latest.eslint
    nodePackages_latest.eslint_d
    # HTML, CSS, JSON, Javascript, Typescript, JSX, TSX
    nodePackages_latest.prettier
    nodePackages_latest.prettier_d_slim
    # Lua
    stylua
    luajitPackages.luacheck
    # Nix
    statix
    deadnix
    alejandra
    # Rust
    rustfmt
    # Markdown
    nodePackages_latest.markdownlint-cli
    # SQL
    sqlfluff
    # JSON
    jq
    nodePackages_latest.jsonlint
    # Prose
    proselint
    # Editor Config
    editorconfig-checker
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/jose-elias-alvarez/null-ls.nvim/
    {
      plugin = null-ls-nvim;
      type = "lua";
      config = ''
        local nullls = require "null-ls"
        local builtins = nullls.builtins

        nullls.setup({
            sources = {
                builtins.code_actions.eslint_d,
                builtins.diagnostics.eslint_d,
                builtins.formatting.prettier_d_slim,

                -- Markdown
                builtins.formatting.markdownlint,
                builtins.diagnostics.markdownlint,

                -- SQL
                builtins.diagnostics.sqlfluff,
                builtins.formatting.sqlfluff,

                -- JSON
                builtins.formatting.jq,
                builtins.diagnostics.jsonlint,

                -- Nix
                builtins.diagnostics.statix,
                builtins.code_actions.statix,
                builtins.diagnostics.deadnix,
                builtins.formatting.alejandra,

                -- Lua
                builtins.formatting.stylua,
                builtins.code_actions.statix,
                builtins.diagnostics.luacheck,

                -- Rust
                builtins.formatting.rustfmt,

                -- Prose
                builtins.formatting.shfmt,

                -- Prose
                builtins.diagnostics.proselint,

                -- Editor Config
                builtins.diagnostics.editorconfig_checker.with({
                  command = "editorconfig-checker",
                }),

                -- Trailing whitespace
                -- builtins.diagnostics.trail_space.with({
                --   disabled_filetypes = { "mail" },
                -- }),
            },
        })
      '';
    }
  ];
}
