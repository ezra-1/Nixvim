{ pkgs, ... }:

{
  # Core modules only
  imports = [
    ./core
  ];

  # Aliases
  viAlias = true;
  vimAlias = true;

  # Leader key
  globals.mapleader = " ";

  # Clipboard (Wayland only)
  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };

  # Plugins
  plugins = {
    persistence.enable = true;
    direnv.enable = true;
    web-devicons.enable = true;
    lastplace.enable = true;
    nvim-autopairs.enable = true;

    tmux-navigator.enable = true;

    better-escape = {
      enable = true;
      settings.timeout = 200;
    };

    zellij = {
      enable = true;
      settings.vimTmuxNavigatorKeybinds = true;
    };
  };
}
