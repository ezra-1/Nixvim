{
  plugins.gitsigns = {
    enable = true;

    settings = {
      signs = {
        add = {
          text = "┃";
        };

        change = {
          text = "┋";
        };

        delete = {
          text = "▶";
        };

        topdelete = {
          text = "▶";
        };

        changedelete = {
          text = "┃";
        };
      };

      watch_gitdir = {
        interval = 1000;
        follow_files = true;
      };

      attach_to_untracked = true;

      current_line_blame_formatter =
        "<author>, <author_time:%Y-%m-%d> - <summary>";

      update_debounce = 200;
      max_file_length = 40000;

      preview_config = {
        border = "rounded";
        style = "minimal";
        relative = "cursor";
        row = 0;
        col = 1;
      };
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 =
        "<leader>gj";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').next_hunk({navigation_message = false})<cr>";
      desc = "Next Hunk";
    }

    {
      __unkeyed-1 =
        "<leader>gk";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').prev_hunk({navigation_message = false})<cr>";
      desc = "Prev Hunk";
    }

    {
      __unkeyed-1 = "<leader>gp";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').preview_hunk()<cr>";
      desc = "Preview Hunk";
    }

    {
      __unkeyed-1 = "<leader>gr";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').reset_hunk()<cr>";
      desc = "Reset Hunk";
    }

    {
      __unkeyed-1 = "<leader>gl";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').blame_line()<cr>";
      desc = "Blame";
    }

    {
      __unkeyed-1 = "<leader>gR";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').reset_buffer()<cr>";
      desc = "Reset Buffer";
    }

    {
      __unkeyed-1 = "<leader>gs";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').stage_hunk()<cr>";
      desc = "Stage Hunk";
    }

    {
      __unkeyed-1 = "<leader>gu";
      __unkeyed-2 =
        "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>";
      desc = "Undo Stage Hunk";
    }

    {
      __unkeyed-1 = "<leader>gd";
      __unkeyed-2 = "<cmd>Gitsigns diffthis HEAD<cr>";
      desc = "Git Diff";
    }
  ];
}
