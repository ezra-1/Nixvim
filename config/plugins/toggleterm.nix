{
  plugins.toggleterm = {
    enable = true;

    settings = {
      # General
      direction = "float";
      start_in_insert = true;
      insert_mappings = true;
      terminal_mappings = true;
      persist_size = true;
      persist_mode = true;
      auto_scroll = true;
      autochdir = true;
      shade_terminals = false;
      close_on_exit = true;

      # Toggle terminal
      open_mapping = "[[<M-f>]]";

      # Floating terminal
      float_opts = {
        border = "rounded";
        width = 150;
        height = 35;
        winblend = 0;
        title_pos = "center";
      };

      # Dynamic sizing
      size = ''
        function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.40
          end
        end
      '';

      # Highlights
      highlights = {
        FloatBorder = {
          guifg = "#7aa2f7";
        };

        NormalFloat = {
          link = "Normal";
        };
      };
    };
  };

  keymaps = [
    # Toggle terminal
    {
      mode = "n";
      key = "<leader>;";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        desc = "Toggle terminal";
      };
    }

    # Floating terminal
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>lua _FLOAT_TOGGLE()<CR>";
      options = {
        desc = "Floating terminal";
      };
    }

    # Horizontal terminal
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>lua _HORIZONTAL_TOGGLE()<CR>";
      options = {
        desc = "Horizontal terminal";
      };
    }

    # Vertical terminal
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>lua _VERTICAL_TOGGLE()<CR>";
      options = {
        desc = "Vertical terminal";
      };
    }

    # LazyGit
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua _LAZYGIT_TOGGLE()<CR>";
      options = {
        desc = "LazyGit";
      };
    }

    # Terminal escape
    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
      options = {
        desc = "Exit terminal mode";
      };
    }

    {
      mode = "t";
      key = "jk";
      action = "<C-\\><C-n>";
      options = {
        desc = "Exit terminal mode";
      };
    }

    # Terminal window navigation
    {
      mode = "t";
      key = "<C-h>";
      action = "<Cmd>wincmd h<CR>";
      options = {
        desc = "Go to left window";
      };
    }

    {
      mode = "t";
      key = "<C-j>";
      action = "<Cmd>wincmd j<CR>";
      options = {
        desc = "Go to lower window";
      };
    }

    {
      mode = "t";
      key = "<C-k>";
      action = "<Cmd>wincmd k<CR>";
      options = {
        desc = "Go to upper window";
      };
    }

    {
      mode = "t";
      key = "<C-l>";
      action = "<Cmd>wincmd l<CR>";
      options = {
        desc = "Go to right window";
      };
    }
  ];

  extraConfigLua = ''
    local Terminal = require("toggleterm.terminal").Terminal

    ------------------------------------------------------------------
    -- LazyGit
    ------------------------------------------------------------------

    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "rounded",
      },
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    ------------------------------------------------------------------
    -- Floating Terminal
    ------------------------------------------------------------------

    local floating = Terminal:new({
      direction = "float",
      hidden = true,
    })

    function _FLOAT_TOGGLE()
      floating:toggle()
    end

    ------------------------------------------------------------------
    -- Horizontal Terminal
    ------------------------------------------------------------------

    local horizontal = Terminal:new({
      direction = "horizontal",
      hidden = true,
    })

    function _HORIZONTAL_TOGGLE()
      horizontal:toggle()
    end

    ------------------------------------------------------------------
    -- Vertical Terminal
    ------------------------------------------------------------------

    local vertical = Terminal:new({
      direction = "vertical",
      hidden = true,
    })

    function _VERTICAL_TOGGLE()
      vertical:toggle()
    end
  '';
}
