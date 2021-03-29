syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set laststatus=2
set noshowmode



call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mattn/emmet-vim'

call plug#end()


let g:lightline = {
      \ 'colorscheme': 'srcery_drk',
      \ }

