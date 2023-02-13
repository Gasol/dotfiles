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
    { import = "lazyvim.plugins.colorscheme" },
    { import = "lazyvim.plugins.util" },
    { import = "lazyvim.plugins.editor" },
    { import = "lazyvim.plugins.coding" },
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
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "diff" },
  command = "hi link @text.diff.add diffAdded",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "diff" },
  command = "hi link @text.diff.delete diffRemoved",
})
vim.cmd.colorscheme("tokyonight-night")
vim.cmd("highlight CopilotSuggestion guifg=#c9a3d6 ctermfg=8")
