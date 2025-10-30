-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local set = vim.opt
set.guifont = "Menlo-Regular:h14"
set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.termguicolors = true
set.hlsearch = true
set.background = "dark"
set.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc"
set.updatetime = 300
set.scrolloff = 4
set.shortmess:append("c")
set.pumblend = 15
set.inccommand = "nosplit"
set.cursorline = true
set.showmode = false
set.sidescrolloff = 8
set.smartcase = true
set.smartindent = true
set.timeoutlen = 500
set.wildmode = { "longest:full", "full" }
set.winheight = 3
set.winminheight = 3
set.updatetime = 1000
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false
set.formatexpr = ""

vim.cmd("hi PmenuSel blend=0")
if vim.fn.executable("rg") == 1 then
  set.grepprg = "rg --vimgrep --no-heading --hidden --glob '!.git'"
  set.grepformat = "%f:%l:%c:%m"
end
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})
vim.g.better_whitespace_filetypes_blacklist = {
  "snacks_dashboard",
  "dashboard",
  "diff",
  "git",
  "gitcommit",
  "unite",
  "qf",
  "help",
  "markdown",
  "fugitive",
}

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
