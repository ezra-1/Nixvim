{
  autoGroups = {
    YankHighlight = { clear = true; };
    bufcheck = { clear = true; };
    large_buf = { clear = true; };
    close-with-q = { clear = true; };
    auto_open_nvimtree = { clear = true; };
    wrap_spell = { clear = true; };
    terminal_settings = { clear = true; };
    UserLspConfig = { };
  };

  autoCmd = [
    # Highlight on yank
    {
      event = "TextYankPost";
      group = "YankHighlight";
      pattern = "*";
      callback.__raw = ''
        function()
          vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
          })
        end
      '';
    }

    # Terminal settings (auto insert mode)
    {
      event = [ "TermOpen" "TermEnter" ];
      group = "terminal_settings";
      pattern = "term://*";
      command = "startinsert!";
    }

    # Close special buffers with 'q'
    {
      event = "FileType";
      group = "close-with-q";
      pattern = [
        "PlenaryTestPopup"
        "help"
        "lspinfo"
        "man"
        "notify"
        "qf"
        "query"
        "spectre_panel"
        "startuptime"
        "tsplayground"
        "neotest-output"
        "neotest-summary"
        "neotest-output-panel"
        "checkhealth"
      ];
      callback.__raw = ''
        function(data)
          vim.bo[data.buf].buflisted = false
          vim.keymap.set("n", "q", "<cmd>close<cr>", {
            buffer = data.buf,
            silent = true,
          })
        end
      '';
    }

    # Enable wrap + spell for markdown and git commits
    {
      event = "FileType";
      group = "wrap_spell";
      pattern = [ "gitcommit" "markdown" ];
      callback.__raw = ''
        function()
          vim.opt_local.wrap = true
          vim.opt_local.spell = true
        end
      '';
    }

    # Open nvim-tree automatically when entering a directory
    {
      event = "VimEnter";
      group = "auto_open_nvimtree";
      callback.__raw = ''
        function(data)
          local is_dir = vim.fn.isdirectory(data.file) == 1
          if not is_dir then return end

          vim.cmd.cd(data.file)
          require("nvim-tree.api").tree.open()
        end
      '';
    }
  ];
}
