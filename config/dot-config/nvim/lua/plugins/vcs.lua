return {
  {
    "tpope/vim-git",
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>G", "<cmd>topleft G<cr>", { silent = true } },
      -- { "<leader>gb", "<cmd>Git blame<cr>", { silent = true } },
    },
  },
  {
    "tpope/vim-rhubarb",
    lazy = true,
    ft = { "gitcommit" },
    cmd = "GBrowse",
  },
  {
    "shumphrey/fugitive-gitlab.vim",
    lazy = true,
    ft = { "gitcommit" },
    cmd = "GBrowse",
  },
  {
    "elliotekj/claude-commit.nvim",
    ft = "gitcommit",
    config = function()
      require("claude-commit").setup({
        auto_suggest = true,
        keybinding = "<leader>ga",
        timeout = 10000,
      })
    end,
  },
}
