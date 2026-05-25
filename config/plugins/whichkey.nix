{
  plugins.which-key = {
    enable = true;

    settings = {
      spec = [
        # Basic
        {
          __unkeyed-1 = "<leader>w";
          __unkeyed-2 = "<cmd>confirm w<CR>";
          desc = "Save";
        }
        {
          __unkeyed-1 = "<leader>q";
          __unkeyed-2 = "<cmd>confirm q<CR>";
          desc = "Quit";
        }
        {
          __unkeyed-1 = "<leader>h";
          __unkeyed-2 = "<cmd>nohlsearch<CR>";
          desc = "No Highlight";
        }
        {
          __unkeyed-1 = "<leader>v";
          __unkeyed-2 = "<cmd>vsplit<CR>";
          desc = "Vertical Split";
        }

        # Groups
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code Companion";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Debug";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "LSP";
        }
        {
          __unkeyed-1 = "<leader>p";
          group = "Plugins";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Test";
        }

        # Tabs
        {
          __unkeyed-1 = "<leader>a";
          group = "Tabs";
        }
        {
          __unkeyed-1 = "<leader>aN";
          __unkeyed-2 = "<cmd>tabnew %<CR>";
          desc = "New Tab From Buffer";
        }
        {
          __unkeyed-1 = "<leader>an";
          __unkeyed-2 = "<cmd>$tabnew<CR>";
          desc = "New Empty Tab";
        }
        {
          __unkeyed-1 = "<leader>ah";
          __unkeyed-2 = "<cmd>-tabmove<CR>";
          desc = "Move Left";
        }
        {
          __unkeyed-1 = "<leader>al";
          __unkeyed-2 = "<cmd>+tabmove<CR>";
          desc = "Move Right";
        }
        {
          __unkeyed-1 = "<leader>ao";
          __unkeyed-2 = "<cmd>tabonly<CR>";
          desc = "Close Other Tabs";
        }
      ];

      plugins = {
        marks = true;
        registers = true;

        spelling = {
          enabled = true;
          suggestions = 20;
        };
      };

      win = {
        border = "rounded";
        padding = [ 2 2 2 2 ];
      };

      show_help = false;
      show_keys = false;

      disable = {
        filetypes = [ "TelescopePrompt" ];
      };
    };
  };
}
