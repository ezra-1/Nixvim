{
  plugins.nvim-ufo = {
    enable = true;

    settings = {
      open_fold_hl_timeout = 150;
      close_fold_kinds_for_ft = {
        default = [ "imports" "comment" ];
        json = [ "array" ];
        c = [ "comment" "region" ];
      };

      provider_selector = ''
        function(bufnr, filetype, buftype)
          return { "lsp", "indent" }
        end
      '';

      fold_virt_text_handler = ''
        function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local foldedLines = endLnum - lnum
          local suffix = (" 󰁂 %d "):format(foldedLines)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0

          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local hlGroup = chunk[2]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)

            if curWidth + chunkWidth < targetWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              table.insert(newVirtText, { chunkText, hlGroup })

              local truncatedWidth = vim.fn.strdisplaywidth(chunkText)

              if curWidth + truncatedWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - truncatedWidth)
              end

              break
            end

            curWidth = curWidth + chunkWidth
          end

          table.insert(newVirtText, { suffix, "MoreMsg" })

          return newVirtText
        end
      '';
    };
  };

  extraConfigLua = ''
    -------------------------------------------------------------------
    -- UFO Fold Configuration
    -------------------------------------------------------------------

    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local ufo = require("ufo")

    -------------------------------------------------------------------
    -- Keymaps
    -------------------------------------------------------------------

    vim.keymap.set("n", "zR", ufo.openAllFolds, {
      desc = "Open all folds"
    })

    vim.keymap.set("n", "zM", ufo.closeAllFolds, {
      desc = "Close all folds"
    })

    vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, {
      desc = "Open folds except kinds"
    })

    vim.keymap.set("n", "zm", ufo.closeFoldsWith, {
      desc = "Close folds with"
    })

    vim.keymap.set("n", "zK", function()
      local winid = ufo.peekFoldedLinesUnderCursor()

      if not winid then
        vim.lsp.buf.hover()
      end
    end, {
      desc = "Peek folded lines"
    })

    -------------------------------------------------------------------
    -- Better Fold Icons
    -------------------------------------------------------------------

    vim.fn.sign_define("UfoFoldedEllipsis", {
      text = "⋯",
      texthl = "Comment"
    })

    -------------------------------------------------------------------
    -- Optional statuscolumn support
    -------------------------------------------------------------------

    -- Uncomment if using Neovim >= 0.10
    -- vim.o.statuscolumn = [[%!v:lua.require('statuscol').get()]]
  '';
}
