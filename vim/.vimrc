call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

syntax on
colorscheme monokai

set autoindent
set smartindent
set expandtab
set number
set relativenumber
set ruler
set shiftwidth=4
set laststatus=2

autocmd BufRead,BufNewFile,BufReadPost .custom_* set filetype=sh
autocmd BufRead,BufNewFile,BufReadPost .paths set filetype=sh

set rtp+=/usr/local/opt/fzf
