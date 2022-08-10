{ homeDirectory }:

{
  installLvim = {
    after = [ "writeBoundary" ];
    before = [ ];
    data = ''
      command -v foo >/dev/null 2>&1 || {
        echo "Installing LunarVim\n";
        rm -f "${homeDirectory}/.npm/bin/{neovim-node-host,tree-sitter}" ${homeDirectory}/.config/lvim/config.lua;
        echo y | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) 
        echo "Installed LunarVim\n";
      }
    '';
  };
}
