call plug#begin('~/.config/nvim/plugged')
Plug 'hoob3rt/lualine.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdtree'
call plug#end()

source ~/.config/nvim/coc.vim

syntax on
set termguicolors

set cmdheight=2
"set clipboard+=unnamedplus
set expandtab
set ignorecase
set smartcase
set laststatus=2
set linebreak
set mouse=a
set number
set relativenumber
set rtp+=/usr/local/opt/fzf
set ruler
set signcolumn=yes
set shiftwidth=4
set smartindent
set title

" Remaps
let mapleader = ","

" NeoVim
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Material
let g:material_style = 'darker'
let g:material_italic_comments = 1
let g:material_italic_keywords = 1
let g:material_italic_functions = 1
let g:material_variable_color = '#9ca3cb'
colorscheme material

" NERDTree
let g:NERDTreeShowHidden = 1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" CoC
let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-fzf-preview', 'coc-go', 'coc-highlight', 'coc-html', 'coc-html-css-support', 'coc-json', 'coc-markdownlint', 'coc-pyright', 'coc-pydocstring', 'coc-sh', 'coc-sql', 'coc-toml', 'coc-yaml', 'coc-xml']

" Automatic commands
autocmd BufWritePre *.py :silent call CocAction('runCommand', 'python.sortImports')
"command! -nargs=0 OR :silent call CocAction('runCommand', 'python.sortImports')

" Package configuration
lua <<EOF
require'lualine'.setup {
  options = {
    theme = 'material-nvim'
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "cmake", "haskell", "verilog" },     -- List of parsers to ignore installing
  highlight = {
    enable = true,          -- false will disable the whole extension
    disable = { },          -- list of language that will be disabled
  },
}
EOF
