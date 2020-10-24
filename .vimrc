" Vundle
set nocompatible
filetype off
let mapleader="\<Space>"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins

" Status/tabline
Plugin 'vim-airline/vim-airline'

" File system explorer
Plugin 'scrooloose/nerdtree'

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

" C# Development
Plugin 'OmniSharp/omnisharp-vim'

" Code linting
Plugin 'w0rp/ale'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'euclio/vim-markdown-composer'

" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

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
set mouse=a
set clipboard=exclude:.*
:hi Error NONE
highlight Comment ctermfg=green

" Permanent undo
set undodir=~/.vim/.vimdid
set undofile

" God Mode
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Terminal to Ctrl+a
map <C-a> :ter<CR>

" Enable clang format autoformat on save
autocmd FileType c,cpp ClangFormatAutoEnable

" Autopep8 code formatting for Python
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

" Vim Markdown/Composer
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:markdown_folding = 0
let g:markdown_composer_autostart = 0
let g:markdown_composer_syntax_theme = 'monokai'
map <C-M> :ComposerStart<CR>

" Stop trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Clear search highlighting 
nnoremap <silent> <C-L> :noh<CR><C-L>

" Omnisharp
let g:OmniSharp_server_use_mono = 1
  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
nnoremap <C-o><C-r> :!dotnet run
let g:OmniSharp_want_snippet=1

" Ale Config
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Nerd Tree Ctrl+O 
map <C-o> :NERDTreeToggle<CR>

" fzf
set rtp+=/usr/local/opt/fzf
