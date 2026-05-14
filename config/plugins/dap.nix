{ pkgs, ... }:

{
  # ==================================================
  # DAP plugins
  # ==================================================
  extraPlugins = with pkgs.vimPlugins; [
    nvim-gdb
  ];

  plugins = {
    # Core DAP
    dap = {
      enable = true;

      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };

        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };

        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };

      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];
      };
    };

    dap-go.enable = true;
    dap-python.enable = true;

    dap-ui = {
      enable = true;

      settings = {
        floating = {
          mappings = {
            close = [ "<ESC>" "q" ];
          };
        };
      };
    };

    dap-virtual-text.enable = true;
  };

  # ==================================================
  # Debug UI + keymaps
  # ==================================================
  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")

    -- ==============================
    -- UI auto open / close
    -- ==============================
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
      dap.repl.close()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
      dap.repl.close()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- ==============================
    -- Keymaps
    -- ==============================
    vim.keymap.set({ "n", "i", "v", "x", "t" }, "<F5>", function()
      require("nvim-tree.api").tree.close()
      vim.cmd("startinsert")
      dap.continue()
    end, { silent = true })

    vim.keymap.set({ "n", "i", "v", "x" }, "<S-F5>", function()
      dap.terminate()
    end, { silent = true })

    vim.keymap.set("n", "<Leader>dt", dapui.toggle)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

    vim.keymap.set("n", "<F10>", dap.step_over)
    vim.keymap.set("n", "<F11>", dap.step_into)
    vim.keymap.set("n", "<F12>", dap.step_out)

    vim.keymap.set("n", "<Leader>dr", dap.repl.open)
    vim.keymap.set("n", "<Leader>dl", dap.run_last)

    -- ==============================
    -- Debug log (optional)
    -- ==============================
    dap.set_log_level("DEBUG")

    -- ==============================
    -- Adapters
    -- ==============================
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-q", "-i", "dap" },
    }

    dap.adapters.lldb = {
      type = "executable",
      command = "${pkgs.lldb}/bin/lldb-dap",
      name = "lldb",
    }

    dap.adapters.codelldb = {
      type = "server",
      port = 13000,
      executable = {
        command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb",
        args = { "--port", "13000" },
      },
    }

    -- ==============================
    -- C / C++
    -- ==============================
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = vim.fn.getcwd(),
      },
    }

    dap.configurations.c = dap.configurations.cpp

    -- ==============================
    -- Rust
    -- ==============================
    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          require("nvim-tree.api").tree.close()

          return vim.fn.getcwd()
            .. "/target/debug/"
            .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end,
        cwd = vim.fn.getcwd(),
        stopOnEntry = false,
        args = {},
      },
    }

    -- ==============================
    -- Zig
    -- ==============================
    dap.configurations.zig = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = vim.fn.getcwd(),
        stopOnEntry = false,
        args = {},
      },
    }

    -- ==============================
    -- Java (extra safety override)
    -- ==============================
    dap.configurations.java = {
      {
        type = "java",
        request = "launch",
        name = "Launch Java Program",
      },
    }
  '';
}
