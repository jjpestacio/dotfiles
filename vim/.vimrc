call plug#begin()
Plug 'crusoexia/vim-monokai'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

syntax on
colorscheme monokai
set termguicolors

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set laststatus=2
set number
set relativenumber
set ruler

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

autocmd BufRead,BufNewFile,BufReadPost .custom_* set filetype=sh
autocmd BufRead,BufNewFile,BufReadPost .paths set filetype=sh

set rtp+=/usr/local/opt/fzf
