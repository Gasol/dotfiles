return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    keys = {
      { "j", "<Plug>(accelerated_jk_gj)" },
      { "k", "<Plug>(accelerated_jk_gk)" },
    },
  },
  {
    "ntpeters/vim-better-whitespace",
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "tpope/vim-dispatch",
    lazy = true,
    cmd = { "Make", "Dispatch", "Start" },
  },
  {
    "tpope/vim-characterize", -- unicode metadata lookup
    lazy = true,
    keys = "gaa",
    config = function()
      vim.keymap.set("n", "gaa", "<Plug>(characterize)", { desc = "Print character metadata" })
    end,
  },
  {
    "tpope/vim-repeat",
  },
  {
    "tpope/vim-surround",
  },
  {
    "tpope/vim-obsession",
  },
  {
    "tpope/vim-rsi",
  },
  {
    "jeffkreeftmeijer/vim-numbertoggle",
  },
  {
    "embear/vim-localvimrc",
    init = function()
      vim.g.localvimrc_persistent = 1
    end,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "tzachar/local-highlight.nvim",
    config = function()
      require("local-highlight").setup()
    end,
  },
}
