return {
  {
    "tpope/vim-git",
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>G", "<cmd>topleft G<cr>", { silent = true } },
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
    "sodapopcan/vim-twiggy",
    lazy = true,
    cmd = "Twiggy",
  },
}
