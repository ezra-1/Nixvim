{
  # ==================================================
  # Snippet engine
  # ==================================================
  plugins.luasnip = {
    enable = true;
  };

  # ==================================================
  # Completion sources
  # ==================================================
  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;

    # optional / usually disabled unless needed
    cmp-cmdline.enable = false;
    nix.enable = true;
  };

  # ==================================================
  # nvim-cmp core configuration
  # ==================================================
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings = {
      # ------------------------------------------------
      # Snippet expansion (correct LuaSnip usage)
      # ------------------------------------------------
      snippet = {
        expand = ''
          function(args)
            require("luasnip").lsp_expand(args.body)
          end
        '';
      };

      # ------------------------------------------------
      # Ghost text (inline preview)
      # ------------------------------------------------
      experimental = {
        ghost_text = true;
      };

      # ------------------------------------------------
      # Performance tuning
      # ------------------------------------------------
      performance = {
        debounce = 60;
        fetchingTimeout = 200;
        maxViewEntries = 30;
      };

      # ------------------------------------------------
      # Completion formatting
      # ------------------------------------------------
      formatting = {
        fields = [ "kind" "abbr" "menu" ];
      };

      # ------------------------------------------------
      # UI styling
      # ------------------------------------------------
      window = {
        completion = {
          border = "rounded";
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
        };

        documentation = {
          border = "rounded";
        };
      };

      # ------------------------------------------------
      # Completion sources (priority order matters)
      # ------------------------------------------------
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "nvim_lua"; }
        { name = "crates"; } # remove if not using Rust
      ];

      # ------------------------------------------------
      # Key mappings (fixed + more stable behavior)
      # ------------------------------------------------
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";

        "<CR>" = "cmp.mapping.confirm({ select = true })";

        "<Tab>" = "cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require('luasnip').expand_or_jumpable() then
            require('luasnip').expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' })";

        "<S-Tab>" = "cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require('luasnip').jumpable(-1) then
            require('luasnip').jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' })";

        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
      };
    };
  };
}
