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
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'hugolgst/vimsence'
Plugin 'tell-k/vim-autopep8'

call vundle#end()            " required
filetype plugin on    " required

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
highlight Comment ctermfg=green

" Color scheme
" let g:molokai_original = 1
" colorscheme molokai

" Hard Mode
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Up> <Nop>

" Automatically closing braces & quotes
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" Tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
noremap <Leader>tN :tabnew<CR>
noremap <Leader>tc :tabclose<CR>
noremap <Leader>tm :tabmove<CR>
noremap <Leader>tn :tabnext<CR>
noremap <Leader>tp :tabprevious<CR>

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
