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
    lazy = true,
    keys = "gc",
  },
  {
    "tpope/vim-dispatch",
  },
  {
    "tpope/vim-unimpaired", -- complementary pairs of mappings
    lazy = true,
    event = "InsertEnter",
  },
  {
    "tpope/vim-characterize", -- unicode metadata lookup
    lazy = true,
    keys = "ga",
    config = function()
      vim.keymap.set("n", "ga", "<Plug>(characterize)", { desc = "Print character metadata" })
    end,
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
