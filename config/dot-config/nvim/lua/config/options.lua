vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.guifont = "Menlo-Regular:h14"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.termguicolors = true
opt.hlsearch = true
opt.background = "dark"
opt.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc"
opt.updatetime = 300
opt.scrolloff = 4
opt.shortmess:append("c")
opt.pumblend = 15
vim.cmd("hi PmenuSel blend=0")
if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --no-heading --hidden --glob '!.git'"
  opt.grepformat = "%f:%l:%c:%m"
end
