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
    "tpope/vim-commentary",
  },
  {
    "tpope/vim-dispatch",
  },
  {
    "tpope/vim-unimpaired", -- complementary pairs of mappings
  },
  {
    "tpope/vim-characterize", -- unicode metadata lookup
  },
  {
    "zbirenbaum/copilot.lua",
    name = "copilot",
    cmd = "Copilot",
    lazy = true,
    event = { "InsertEnter" },
    config = true,
  },
}
