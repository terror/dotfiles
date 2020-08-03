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
Plugin 'hugolgst/vimsence'
Plugin 'tell-k/vim-autopep8'
Plugin 'sheerun/vim-polyglot'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required

" Config
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set hlsearch
set ruler
set number
set numberwidth=1
set backspace=indent,eol,start
set belloff=all
set splitbelow
set termwinsize=10x0
:hi Error NONE
highlight Comment ctermfg=green

" Hard Mode
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Up> <Nop>

" Terminal
map <C-a> :ter<CR>

" Enable clang format autoformat on save
autocmd FileType c,cpp ClangFormatAutoEnable

" autopep8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

" Disable Terminal bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" C++ Template
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/standard.cpp
