{
  config.opts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Tabs / indentation
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = true;
    showtabline = 2;

    # UI / editing behavior
    wrap = false;
    breakindent = true;
    hlsearch = true;
    incsearch = true;
    cursorline = true;
    mouse = "a";
    signcolumn = "yes";

    # Window splits
    splitbelow = true;
    splitright = true;

    # Search / grep
    ignorecase = true;
    smartcase = true;
    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";

    # Performance / responsiveness
    updatetime = 50;
    timeoutlen = 250;
    scrolloff = 8;

    # Completion behavior
    completeopt = [ "menuone" "noselect" "noinsert" ];

    # Persistent undo
    undofile = true;

    # Visual / UI polish
    termguicolors = true;
    fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:";

    # Folding (recommended for nvim-ufo)
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    # Encoding
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Session persistence
    sessionoptions = "blank,buffers,curdir,folds,globals,help,options,tabpages,winsize,winpos,terminal,localoptions";

    # Optional / experimental (kept for reference)
    # cmdheight = 2;
    # showmode = false;
    # pumheight = 0;
    # colorcolumn = "80";
  };
}
