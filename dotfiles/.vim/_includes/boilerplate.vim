" Main config and necessary settings
set nocompatible

set dir=/tmp

" GUI
set encoding=UTF-8
set background=dark
colorscheme monokai
set t_Co=256
set term=xterm-256color
set macligatures
set guifont=Fira\ Code\ Regular:h12

" Misc
set laststatus=2
set noswapfile
set autoread
set autoindent
set smartindent
set rnu
set laststatus=2
set splitright
set splitbelow

" Search
set number
set incsearch
set hlsearch

" spaces instead of tabs
set expandtab
set smarttab
set tabstop     =2
set shiftwidth  =2
set smartindent
set autoindent

" Syntax
syntax enable
filetype plugin indent on