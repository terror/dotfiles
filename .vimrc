" Vundle
set nocompatible             
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'prettier/vim-prettier'
Plugin 'rhysd/vim-clang-format'

call vundle#end()            " required
filetype plugin on    " required

" Config
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set numberwidth=1
set backspace=indent,eol,start
set belloff=all
highlight Comment ctermfg=green

" Color scheme
let g:molokai_original = 1
colorscheme molokai

" No need for arrow keys
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Automatically closing braces & quotes
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" Enable autoformat on save
autocmd FileType c,cpp ClangFormatAutoEnable

" Disable Terminal bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


" C++ Template
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/standard.cpp

