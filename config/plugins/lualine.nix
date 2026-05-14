{
  # ==================================================
  # Lualine — Clean & Modern Statusline
  # ==================================================
  plugins.lualine = {
    enable = true;

    settings = {
      # ------------------------------------------------
      # Plugin Integrations
      # ------------------------------------------------
      extensions = [
        "quickfix"
        "man"
        "fugitive"
        "nvim-tree"
        "toggleterm"
        "nvim-dap-ui"
      ];

      # ------------------------------------------------
      # Global Configuration
      # ------------------------------------------------
      options = {
        theme = "auto";

        # Minimal separators for cleaner look
        component_separators = {
          left = "";
          right = "";
        };

        section_separators = {
          left = "";
          right = "";
        };

        # Disable statusline in special buffers
        disabled_filetypes = {
          statusline = [
            "NvimTree"
            "packer"
            "alpha"
            "dashboard"
          ];
        };

        # Single global statusline
        globalstatus = true;
      };

      # ------------------------------------------------
      # Statusline Sections
      # ------------------------------------------------
      sections = {
        # Current Vim mode
        lualine_a = [ "mode" ];

        # Git branch
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
        ];

        # Diagnostics
        lualine_c = [
          {
            __unkeyed-1 = "diagnostics";

            sources = [ "nvim_diagnostic" ];

            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = " ";
            };

            colored = true;
            update_in_insert = false;
          }
        ];

        # File information + Copilot
        lualine_x = [
          {
            __unkeyed-1 = "filetype";
            icons_enabled = true;
          }
        ];

        # File progress
        lualine_y = [ "progress" ];

        # Cursor position
        lualine_z = [ "location" ];
      };
    };
  };
}
