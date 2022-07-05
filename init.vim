call plug#begin(stdpath('data') . '/plugged')
Plug 'Olical/aniseed'
Plug 'Olical/fennel.vim'

Plug 'windwp/nvim-autopairs'
call plug#end()

let g:aniseed#env = v:true
