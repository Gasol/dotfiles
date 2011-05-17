call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set t_Co=256
set incsearch
set hls
set nu
set ru
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set cursorcolumn
set modeline
set nocompatible
set backspace=indent,eol,start
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=50

filetype plugin indent on

" python syntax highlight
let python_highlight_all = 1
let python_sync_slow = 1

" autocomplete
autocmd FileType php set omnifunc=phpcomplete
autocmd FileType py set omnifunc=pythoncomplete
autocmd FileType python syntax keyword pythonDecorator True None False self
autocmd FileType css set omnifunc=csscomplete
autocmd BufNewFile,BufRead *.phtml so set filetype=php
autocmd BufNewFile,BufRead *.mako so set filetype=mako
autocmd BufNewFile,BufRead *.gradle so set filetype=groovy

map th :tabprev<CR>
map tl :tabnext<CR>
