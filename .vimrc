set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.submodules/vundle
call vundle#begin()

" General purpose plugins
Plugin 'VundleVim/Vundle.vim'         " plugin manager
Plugin 'vim-airline/vim-airline'      " status bar
Plugin 'scrooloose/nerdtree'          " file explorer
Plugin 'junegunn/fzf'                 " command line fuzzy finder
Plugin 'junegunn/fzf.vim'             " command line fuzzy finder
Plugin 'hugolgst/vimsence'            " discord rich presence
Plugin 'junegunn/goyo.vim'            " distraction free writing

" Code related plugins
Plugin 'tell-k/vim-autopep8'          " python code formatting
Plugin 'rhysd/vim-clang-format'       " c++ code formatting
Plugin 'prettier/vim-prettier'        " javascript code formatting
Plugin 'sheerun/vim-polyglot'         " syntax support for many languages
Plugin 'rust-lang/rust.vim'           " rust support
Plugin 'jiangmiao/auto-pairs'         " pair completion
Plugin 'w0rp/ale'                     " code linting
Plugin 'godlygeek/tabular'            " text filtering and alignment
Plugin 'plasticboy/vim-markdown'      " markdown support
Plugin 'euclio/vim-markdown-composer' " render markdown in the browser

call vundle#end()
filetype plugin on

" settings

set expandtab                          " expand tabs to spaces by default
set ai                                 " auto indenting
set hlsearch                           " highlight search terms
set ruler                              " show the cursor position
set number                             " show line numbers
set splitbelow                         " splits happen below
set nofoldenable                       " disable folding
set undofile                           " save undo history

set background    =dark                " use a dark background
set shiftwidth    =4                   " number of spaces to use for auto indenting
set tabstop       =4                   " a tab is four spaces
set numberwidth   =1                   " room used for line numbers
set backspace     =indent,eol,start    " allow backspacing over everything in insert mode
set belloff       =all                 " disable vim bell sounds
set termwinsize   =10x0                " set size of terminal buffer
set mouse         =a                   " allow mouse to set cursor position
set undodir       =~/.vim/.vimdid      " backup directory location
set rtp           +=/usr/local/opt/fzf " set fzf rtp
set clipboard     =exclude:.*          " disable clipboard
set noerrorbells visualbell t_vb=      " disable terminal bells

"" lettings

let mapleader="\<space>" " set space as leader key

let g:autopep8_on_save                 = 1          " format python file on save
let g:autopep8_disable_show_diff       = 1          " disable show diff window

let g:AutoPairsFlyMode                 = 0          " disable fly mode
let g:AutoPairsShortcutBackInsert      = '<M-b>'    " shortcut

let g:fzf_command_prefix               = 'Z'        " set fzf command prefix to 'Z'

let g:NERDTreeWinPos                   = "right"    " always open nerdtree on right side
let NERDTreeMinimalUI                  = 1          " to remove the ? at the top

let g:rustfmt_autosave                 = 1          " format rust code on save

let g:vim_markdown_conceal             = 0          " do not conceal blocks
let g:vim_markdown_conceal_code_blocks = 0          " do not conceal code blocks
let g:markdown_folding                 = 0          " disable folding
let g:markdown_composer_autostart      = 0          " disable autostart in browser
let g:markdown_composer_syntax_theme   = 'monokai'  " set markdown codeblock theme

let g:ale_fix_on_save                  = 1                             " allow for code fixing on save
let g:ale_set_highlights               = 0                             " disable highlight setting
let g:ale_echo_msg_error_str           = 'E'                           " set 'E' for error
let g:ale_echo_msg_warning_str         = 'W'                           " set 'W' for warning
let g:ale_echo_msg_format              = '[%linter%] %s [%severity%]'  " set error message format

"" mappings

nnoremap<C-a> :ter<CR>               
nnoremap<C-R> :%s/[^[:print:]]//g<CR>        " remove non printable characters
nnoremap - dd                                " remove line with '-'

" leader 
nnoremap<leader>i gg=G<CR>                   " fix indentation
nnoremap<leader>p :Prettier<CR>              " format code with prettier
nnoremap<leader>o :NERDTreeToggle<CR>        " toggle nerdtree with leader o
nnoremap<leader>ev :split $MYVIMRC<CR>       " edit vimrc
nnoremap<leader>sv :source $MYVIMRC<CR>      " source vimrc
nnoremap<leader>" viw<esc>a"<esc>bi"<esc>lel " quote around word

" we don't need arrow keys
nnoremap <up> <nop>                          " disable up in normal mode
nnoremap <down> <nop>                        " disable down in normal mode
inoremap <up> <nop>                          " disable up in ins mode
inoremap <down> <nop>                        " disable down in ins mode
inoremap <left> <nop>                        " disable left in ins mode
inoremap <right> <nop>                       " disable right in ins mode
:map Q <Nop>                                 " map Q to nothing

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> " stop trailing whitespace
nnoremap <silent> <C-L> :noh<CR><C-L>                             " clear search highlighting

"" colors

if &t_Co > 2 || has("gui_running")
  syntax on
  set t_Co=256
  :hi Error NONE
  highlight Comment ctermfg=green
endif

"" autocommands

" enable clang format autoformat on save
autocmd FileType c,cpp ClangFormatAutoEnable

" play nice with markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" map composer start to <leader>m on markdown files
autocmd FileType markdown map<leader>m :ComposerStart<CR>

" disable terminal bells
autocmd GUIEnter * set visualbell t_vb=

" load cpp template on file open 
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/standard.cpp
