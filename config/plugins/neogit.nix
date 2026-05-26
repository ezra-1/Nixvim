{
  plugins.neogit = {
    enable = true;

    settings = {
      auto_refresh = true;
      disable_builtin_notifications = false;
      use_magit_keybindings = false;

      # Open Neogit in a tab
      kind = "tab";

      # Commit popup behavior
      commit_popup = {
        kind = "split";
      };

      # General popup behavior
      popup = {
        kind = "split";
      };

      # Signs
      signs = {
        section = [ "" "" ];
        item = [ "" "" ];
        hunk = [ "" "" ];
      };
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>gg";
      __unkeyed-2 = "<cmd>Neogit<CR>";
      desc = "Neogit";
    }
  ];
}
