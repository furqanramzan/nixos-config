{pkgs, ...}: {
  imports = [
    ./homemanager.nix
    ./pnpm.nix
    ./editorconfig.nix
    ./vscode.nix
    # ./android.nix
  ];
  home.packages = with pkgs; [
    sqlitebrowser
    drawio
    insomnia
    postman
    sublime-merge
    dbeaver

    # slack
    # skypeforlinux
    zoom-us
  ];
}
