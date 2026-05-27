{
  plugins.hop = {
    enable = true;

    settings = {
      case_insensitive = false;
      dim_unmatched = true;

      jump_on_sole_occurrence = true;

      quit_key = "<Esc>";

      reverse_distribution = false;

      teasing = true;

      virtual_cursor = true;

      x_bias = 10;
    };
  };

  keymaps =
    let
      opts = {
        silent = true;
      };
    in
    [
      {
        mode = [ "n" ];
        key = "<leader>hw";
        action = "<cmd>lua require('hop').hint_words()<cr>";

        options = opts // {
          desc = "Hop Words";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>hc";
        action = "<cmd>lua require('hop').hint_char2()<cr>";

        options = opts // {
          desc = "Hop Char2";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>hl";
        action = "<cmd>lua require('hop').hint_lines_skip_whitespace()<cr>";

        options = opts // {
          desc = "Hop Lines";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>f";

        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<cr>";

        options = opts // {
          desc = "Hop After Cursor";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>F";

        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>";

        options = opts // {
          desc = "Hop Before Cursor";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>t";

        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>";

        options = opts // {
          desc = "Hop Till After";
        };
      }

      {
        mode = [ "n" ];
        key = "<leader>T";

        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>";

        options = opts // {
          desc = "Hop Till Before";
        };
      }
    ];
}
