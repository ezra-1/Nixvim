{ pkgs, ... }:
{
  plugins.lint = {
    enable = true;

    lintersByFt = {
      markdown = [
        "markdownlint"
        "vale"
      ];

      c = [ "clangtidy" ];
      cpp = [ "clangtidy" ];

      gitcommit = [ "commitlint" ];

      go = [ "golangci_lint" ];

      json = [ "jsonlint" ];

      lua = [ "luacheck" ];

      python = [ "ruff" ];

      yaml = [ "yamllint" ];

      nix = [ "statix" ];
    };

    linters = {
      # Not working currently:
      # write_good = {
      #   cmd = "${pkgs.write-good}/bin/write-good";
      # };
    };
  };

  extraConfigLua = ''
    local lint = require("lint")

    local lint_augroup =
      vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "InsertLeave",
    }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    local lint_progress = function()
      local linters = require("lint").get_running()

      if #linters == 0 then
        return "󰦕"
      end

      return "󱉶 " .. table.concat(linters, ", ")
    end

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, {
      desc = "Trigger linting",
    })
  '';
}
