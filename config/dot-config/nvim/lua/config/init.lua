require("config.lazy")
require("config.options")
require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      opts = {
        defaults = {
          keymaps = false,
          autocmds = true,
          options = false,
        },
      },
    },
    { import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.colorscheme" },
    { import = "lazyvim.plugins.util" },
    { import = "lazyvim.plugins.editor" },
    { import = "lazyvim.plugins.coding" },
    { import = "lazyvim.plugins.ui" },
    { import = "plugins" },
    { "akinsho/bufferline.nvim", enabled = false },
    {
      "echasnovski/mini.comment",
      enabled = function()
        local has_commenting, _ = pcall(require, "vim._comment")
        return not has_commenting
      end,
    },
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
vim.cmd.colorscheme("tokyonight-night")
