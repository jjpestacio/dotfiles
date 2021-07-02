call plug#begin()
Plug 'patstockwell/vim-monokai-tasty'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
call plug#end()

syntax on
colorscheme vim-monokai-tasty
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
