call plug#begin(stdpath('data') . '/plugged')
Plug 'Olical/aniseed'
Plug 'Olical/fennel.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'windwp/nvim-autopairs'
call plug#end()

let g:aniseed#env = v:true
