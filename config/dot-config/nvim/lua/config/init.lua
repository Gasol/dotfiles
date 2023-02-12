require("config.lazy")
require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      opts = {
        defaults = {
          keymaps = false,
          autocmds = false,
          options = false,
        },
      },
    },
    { import = "lazyvim.plugins.core" },
    { import = "lazyvim.plugins.colorscheme" },
    { import = "lazyvim.plugins.util" },
    { import = "lazyvim.plugins.editor" },
    { import = "lazyvim.plugins.ui" },
    { import = "plugins" },
    { "akinsho/bufferline.nvim", enabled = false },
  },
  defaults = {
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "tutor",
      },
    },
  },
})
