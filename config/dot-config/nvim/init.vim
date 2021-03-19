set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

lua << EOF
if package.loaded['lspconfig'] then
	vim.lsp.set_log_level("info")
	require'lspconfig'.pyright.setup{}
	require'lspconfig'.intelephense.setup{}
	require'lspconfig'.vuels.setup{}
	require'lspconfig'.tsserver.setup{}
end
EOF
