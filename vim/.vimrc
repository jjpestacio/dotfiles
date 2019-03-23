call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'crusoexia/vim-monokai'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set ruler
set number
set relativenumber
syntax on
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set laststatus=2
colorscheme monokai

set rtp+=/usr/local/opt/fzf
