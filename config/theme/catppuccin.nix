{ config, ... }:

{
  # ==================================================
  # 🎨 Catppuccin Theme
  # ==================================================
  colorschemes.catppuccin = {
    enable = config.colorschemes.base16.enable != true;

    settings = {
      # ------------------------------------------------
      # ☕ Theme Variant
      # ------------------------------------------------
      flavour = "mocha";

      background = {
        light = "latte";
        dark = "mocha";
      };

      # ------------------------------------------------
      # 🖥️ Terminal Integration
      # ------------------------------------------------
      term_colors = true;
      transparent_background = true;

      # ------------------------------------------------
      # 🔌 Plugin Integrations
      # ------------------------------------------------
      integrations = {
        # Completion
        cmp = true;

        # UI
        noice = true;
        notify = true;
        which_key = true;

        # File Explorer
        neotree = true;

        # Git
        gitsigns = true;

        # Navigation
        harpoon = true;

        # Treesitter
        treesitter = true;
        treesitter_context = true;

        # Telescope
        telescope.enabled = true;

        # Indent Guides
        indent_blankline.enabled = true;

        # Mini.nvim
        mini.enabled = true;

        # Illuminate
        illuminate = {
          enabled = true;
        };

        # ------------------------------------------------
        # 🧠 Native LSP Styling
        # ------------------------------------------------
        native_lsp = {
          enabled = true;

          # Better inline hint visibility
          inlay_hints = {
            background = true;
          };

          # Diagnostic styling
          underlines = {
            errors = [ "underline" ];
            warnings = [ "underline" ];
            information = [ "underline" ];
            hints = [ "underline" ];
          };
        };
      };
    };
  };
}
