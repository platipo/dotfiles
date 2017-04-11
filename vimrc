if &compatible
  set nocompatible  " Be iMproved
endif
set termguicolors   " enable true colors support
set t_Co=256

" -------------------------------------
"  pathogen
" -------------------------------------
execute pathogen#infect()
" indentLine: https://github.com/Yggdroot/indentLine
let g:indentLine_char = '·'
let g:indentLine_color_term = 241
" -------------------------------------

set number
" Enable filetype plugins
filetype plugin on
filetype indent on
" Enable syntax highlighting
syntax enable
colorscheme contrastneed

" -------------------------------------
" map
" -------------------------------------
let mapleader = ","     " comma is <leader>

" Fast save
nmap <leader>w :w!<cr>
" Togle hlsearch
map <F3> :noh<cr>
" -------------------------------------


" -------------------------------------
"  Tab settings
" -------------------------------------
" Use smart spaces instead of tabs
set expandtab
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" -------------------------------------

" Turn backup off
set nobackup
set nowb
set noswapfile

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
