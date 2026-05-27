{ ... }:
{
  plugins.comment = {
    enable = true;

    settings = {
      toggler = {
        line = "gcc";
        block = "gbc";
      };

      opleader = {
        line = "gc";
        block = "gb";
      };

      extra = {
        above = "gcO";
        below = "gco";
        eol = "gcA";
      };
    };
  };
}
