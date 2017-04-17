" -------------------------------------
"  basic setup
" -------------------------------------
" use vim not vi
set nocompatible
" enable true colors support
set termguicolors
set t_Co=256
" numbers on the right
set number
" enable filetype plugins
filetype plugin on
filetype indent on
" enable syntax highlighting
syntax enable
" dig down into subdirs
" provides: partial :find match and fuzzy search
set path+=**
" display all completion possibilities
set wildmenu
" -------------------------------------

" -------------------------------------
"  pathogen
" -------------------------------------
execute pathogen#infect()
" indentLine: https://github.com/Yggdroot/indentLine
let g:indentLine_char = '·'
let g:indentLine_color_term = 241
" color scheme is loaded in plugins
colorscheme contrastneed
" -------------------------------------


" -------------------------------------
" map
" -------------------------------------
let mapleader = ","     " comma is <leader>

" Fast save
nmap <leader>w :w!<cr>
" Togle hlsearch
map <F3> :set hls!<cr>
" ^^^^^^^^^^^^^^^^^^^^
"  Disable arrows
" ^^^^^^^^^^^^^^^^^^^^
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
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

