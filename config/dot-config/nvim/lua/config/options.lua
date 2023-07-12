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
