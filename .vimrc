" Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins

" Status/tabline
Plugin 'vim-airline/vim-airline'

" Discord Rich Presence
Plugin 'hugolgst/vimsence'

" Code formatting
Plugin 'tell-k/vim-autopep8'
Plugin 'rhysd/vim-clang-format'
Plugin 'prettier/vim-prettier'

" Syntax support for many languages
Plugin 'sheerun/vim-polyglot'

" ( -> ()
Plugin 'jiangmiao/auto-pairs'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required
filetype plugin on    " required

" Basic settings
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
set nofoldenable    " disable folding

" Permanent undo
set undodir=~/.vim/.vimdid
set undofile

:hi Error NONE
highlight Comment ctermfg=green

" God Mode
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

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

" Auto Pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" Vim Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:markdown_folding = 0

" Stop trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

