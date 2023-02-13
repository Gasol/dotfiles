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
    lazy = true,
    filetype = { "gitcommit" },
    cmd = "GBrowse",
  },
  {
    "shumphrey/fugitive-gitlab.vim",
    lazy = true,
    filetype = { "gitcommit" },
    cmd = "GBrowse",
  },
  {
    "sodapopcan/vim-twiggy",
    lazy = true,
    cmd = "Twiggy",
  },
}
