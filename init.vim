call plug#begin(stdpath('data') . '/plugged')
Plug 'Olical/aniseed'
Plug 'Olical/fennel.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'windwp/nvim-autopairs'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'bluz71/vim-nightfly-guicolors'
call plug#end()

let g:aniseed#env = v:true

set termguicolors
colorscheme nightfly
