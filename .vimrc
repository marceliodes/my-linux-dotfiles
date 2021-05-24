syntax on
filetype plugin on

" For mouse input in vim
set mouse=a

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set incsearch
set hlsearch
set linebreak

" For lightline plugin
set laststatus=2
set noshowmode

call plug#begin('~/.vim/plugged')

" Changing quotes
Plug 'tpope/vim-surround'

" Adding lightline on the bottom of vim
Plug 'itchyny/lightline.vim'

" Make css color visible
Plug 'ap/vim-css-color'

" Plugin for Ruby language
Plug 'vim-ruby/vim-ruby'

call plug#end()


let g:lightline = {
      \ 'colorscheme': 'srcery_drk',
      \ }

