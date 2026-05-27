{
  plugins.flash = {
    enable = true;

    settings = {
      modes = {
        char.enabled = false;
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";

      options = {
        desc = "Flash";
        silent = true;
      };
    }

    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action = "<cmd>lua require('flash').treesitter()<cr>";

      options = {
        desc = "Flash Treesitter";
        silent = true;
      };
    }

    {
      mode = [ "o" ];
      key = "r";
      action = "<cmd>lua require('flash').remote()<cr>";

      options = {
        desc = "Remote Flash";
        silent = true;
      };
    }

    {
      mode = [
        "o"
        "x"
      ];
      key = "R";
      action = "<cmd>lua require('flash').treesitter_search()<cr>";

      options = {
        desc = "Treesitter Search";
        silent = true;
      };
    }

    {
      mode = [ "c" ];
      key = "<A-s>";
      action = "<cmd>lua require('flash').toggle()<cr>";

      options = {
        desc = "Toggle Flash Search";
        silent = true;
      };
    }
  ];
}
