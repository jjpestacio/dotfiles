call plug#begin()
Plug 'patstockwell/vim-monokai-tasty'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
call plug#end()

syntax on
colorscheme vim-monokai-tasty
set termguicolors

set autoindent
set dir=~/.cache/vim
set expandtab
set history=1000
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set linebreak
set mouse=a
set number
set relativenumber
set ruler
set shiftround
set shiftwidth=4
set smartindent
set title

let mapleader = ","
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 500 " dont lint so much as you type
let g:ale_sign_column_always = 1
let g:ale_open_list = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 1
let g:ale_virtualenv_dir_names = []

let g:ale_python_pyls_use_global = 1
let g:ale_python_mypy_use_global = 1
let g:ale_python_mypy_ignore_invalid_syntax = 1
let g:ale_python_mypy_options = "--config-file ~/.config/mypy/config"

let g:ale_linters = {'python': ['pyls', 'mypy'], 'sh': 'shellcheck'}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort']}

let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#popup_on_dot = 0

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

autocmd BufRead,BufNewFile,BufReadPost .custom_* set filetype=sh
autocmd BufRead,BufNewFile,BufReadPost .paths set filetype=sh

set rtp+=/usr/local/opt/fzf
