require("config.lazy")
require("config.options")
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
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  command = "hi link @text.diff.add diffAdded",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  command = "hi link @text.diff.delete diffRemoved",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "<cr>", "<c-]>", { buffer = true })
    vim.keymap.set("n", "<bs>", "<c-T>", { buffer = true })
    vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = true })
    vim.cmd([[
    if has('vertsplit')
      let s:ratio = &co / str2float(&lines)
      let s:display_landscape = s:ratio > 2.74
      if s:display_landscape
        wincmd L
      endif
    endif
    ]])
  end,
})
vim.cmd.colorscheme("tokyonight-night")
