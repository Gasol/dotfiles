return {
  {
    "tpope/vim-git",
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>G", "<cmd>G<cr>", { silent = true } },
    },
  },
  {
    "tpope/vim-rhubarb",
  },
  {
    "shumphrey/fugitive-gitlab.vim",
    lazy = true,
    filetype = { "gitcommit" },
    cmd = "GBrowse",
  },
}
