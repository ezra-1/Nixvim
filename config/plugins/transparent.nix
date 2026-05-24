{
  # ==================================================
  # Transparent.nvim
  # ==================================================
  plugins.transparent = {
    enable = true;

    settings = {
      enable = true;

      extra_groups = [
        # General UI
        "NormalFloat"
        "FloatBorder"
        "CursorLine"
        "CursorLineNr"
        "SignColumn"
        "EndOfBuffer"

        # Telescope
        "TelescopeNormal"
        "TelescopeBorder"
        "TelescopePromptNormal"
        "TelescopePromptBorder"
        "TelescopeResultsNormal"
        "TelescopeResultsBorder"
        "TelescopePreviewNormal"
        "TelescopePreviewBorder"

        # NvimTree / Neo-tree
        "NvimTreeNormal"
        "NvimTreeNormalNC"
        "NeoTreeNormal"
        "NeoTreeNormalNC"

        # WhichKey
        "WhichKeyFloat"

        # Bufferline
        "BufferLineFill"
        "BufferLineBackground"

        # Notify
        "NotifyBackground"

        # Lazy
        "LazyNormal"

        # Mason
        "MasonNormal"
      ];

      exclude_groups = [];
    };
  };
}
