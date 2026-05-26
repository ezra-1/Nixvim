{ pkgs, ... }:
{
  plugins = {
    # ========================================
    # LazyDev
    # ========================================
    lazydev.enable = true;

    # ========================================
    # Formatter
    # ========================================
    conform-nvim = {
      enable = true;

      settings = {
        formatters_by_ft = {
          lua = [ "stylua" ];

          javascript = [ "prettierd" ];
          javascriptreact = [ "prettierd" ];

          typescript = [ "prettierd" ];
          typescriptreact = [ "prettierd" ];

          css = [ "prettierd" ];
          html = [ "prettierd" ];

          json = [ "prettierd" ];
          yaml = [ "prettierd" ];
          markdown = [ "prettierd" ];

          python = [ "black" ];

          sh = [ "shfmt" ];
          bash = [ "shfmt" ];

          nix = [ "nixfmt" ];
        };

        format_on_save = {
          timeout_ms = 2000;
          lsp_fallback = true;
        };
      };
    };

    # ========================================
    # LSP
    # ========================================
    lsp = {
      enable = true;

      inlayHints = true;

      servers = {
        lua_ls.enable = true;
        cssls.enable = true;
        html.enable = true;
        ts_ls.enable = true;
        eslint.enable = true;
        pyright.enable = true;
        bashls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;
      };

      keymaps = {
        silent = true;

        lspBuf = {
          gD = "declaration";
          gd = "definition";
          K = "hover";
          gI = "implementation";
          gr = "references";
        };

        diagnostic = {
          gl = "open_float";
        };
      };
    };

    # ========================================
    # Which-Key
    # ========================================
    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>l";
        group = "LSP";
      }

      {
        __unkeyed-1 = "<leader>la";
        __unkeyed-2 = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        desc = "Code Action";
      }

      {
        __unkeyed-1 = "<leader>laa";
        __unkeyed-2 = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        desc = "Code Action (Visual)";
        mode = "v";
      }

      {
        __unkeyed-1 = "<leader>lf";
        __unkeyed-2 = "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
        desc = "Format";
      }

      {
        __unkeyed-1 = "<leader>lF";
        __unkeyed-2 = "<cmd>ConformInfo<CR>";
        desc = "Formatter Info";
      }

      {
        __unkeyed-1 = "<leader>lh";
        __unkeyed-2 = "<cmd>lua vim.diagnostic.open_float({ severity = vim.diagnostic.severity.HINT })<CR>";
        desc = "Hints";
      }

      {
        __unkeyed-1 = "<leader>li";
        __unkeyed-2 = "<cmd>LspInfo<CR>";
        desc = "Info";
      }

      {
        __unkeyed-1 = "<leader>lj";
        __unkeyed-2 = "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<CR>";
        desc = "Next Diagnostic";
      }

      {
        __unkeyed-1 = "<leader>lk";
        __unkeyed-2 = "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<CR>";
        desc = "Prev Diagnostic";
      }

      {
        __unkeyed-1 = "<leader>ll";
        __unkeyed-2 = "<cmd>lua vim.lsp.codelens.run()<CR>";
        desc = "CodeLens Action";
      }

      {
        __unkeyed-1 = "<leader>lq";
        __unkeyed-2 = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        desc = "Quickfix";
      }

      {
        __unkeyed-1 = "<leader>lr";
        __unkeyed-2 = "<cmd>lua vim.lsp.buf.rename()<CR>";
        desc = "Rename";
      }
    ];
  };

  # ========================================
  # Formatter Packages
  # ========================================
  extraPackages = with pkgs; [
    stylua
    prettierd
    black
    shfmt
    nixfmt
  ];

  # ========================================
  # Diagnostics
  # ========================================
  diagnostic.settings = {
    virtual_text = false;
    underline = true;
    update_in_insert = false;
    severity_sort = true;

    signs = {
      text = {
        ERROR = "";
        WARN = "";
        INFO = "";
        HINT = "󰌵";
      };
    };

    float = {
      border = "rounded";
      source = "if_many";
    };
  };

  # ========================================
  # Extra Lua
  # ========================================
  extraConfigLua = ''
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.config("*", {
      capabilities = capabilities,

      on_attach = function(client, bufnr)
        if client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end,
    })

    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,

      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
      },

      float = {
        border = "rounded",
        source = "if_many",
      },
    })
  '';
}
