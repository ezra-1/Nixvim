{ pkgs, ... }:

{
  imports = [
    ./core
    ./themes
    ./plugins
  ];

  viAlias = true;
  vimAlias = true;

  globals.mapleader = " ";

  clipboard = {
    register = "unnamedplus";

    providers = {
      wl-copy.enable = true;
      xclip.enable = true;
    };
  };

  plugins = {
    persistence.enable = true;
    direnv.enable = true;
    web-devicons.enable = true;
    lastplace.enable = true;
    nvim-autopairs.enable = true;
    markdown-preview.enable = true;
    tmux-navigator.enable = true;

    better-escape = {
      enable = true;
      settings.timeout = 200;
    };

    zellij = {
      enable = false;

      settings = {
        vimTmuxNavigatorKeybinds = true;
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    nui-nvim
  ];

  extraPackages = with pkgs; [
    # Utilities
    fd
    go
    gdb
    tmux-sessionizer

    # Formatters
    cmake-format
    nixfmt
    prettier
    prettierd
    ruff
    rustfmt
    shfmt
    stylua

    # Linters
    commitlint
    golangci-lint
    hadolint
    luajitPackages.luacheck
    markdownlint-cli
    yamllint

    # LSP / Debugging
    asm-lsp
    delve
    marksman
  ];
}
