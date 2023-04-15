return {
  {
    "vim-test/vim-test",
    config = function()
      vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>")
      vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>")
      vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<cr>")
      vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>")
      vim.keymap.set("n", "<leader>tg", "<cmd>TestVisit<cr>")
    end,
  },
  {
    "tpope/vim-scriptease",
  },
  {
    "osyo-manga/vim-jplus",
    lazy = true,
    keys = "J",
    config = function()
      vim.keymap.set("n", "J", "<Plug>(jplus)")
    end,
  },
  {
    "yasuhiroki/github-actions-yaml.vim",
  },
  {
    "AndrewRadev/tagalong.vim",
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<F24>]], -- Meta + F12
    },
  },
  {
    "tpope/vim-rails",
    ft = "ruby",
    config = function()
      vim.keymap.set("n", "<leader>r", "<cmd>Rails<cr>")
      vim.keymap.set("n", "<leader>R", "<cmd>Rails")
    end,
  },
}
