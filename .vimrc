set nocompatible
filetype off

"" plugins

filetype plugin on
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'                      " status bar
Plug 'junegunn/goyo.vim'                            " distraction free writing
Plug 'airblade/vim-gitgutter'                       " show git diff in the sign column
Plug 'jiangmiao/auto-pairs'                         " pair completion
Plug 'godlygeek/tabular'                            " text filtering and alignment
Plug 'chriskempson/base16-vim'                      " base16 colors in vim
Plug 'scrooloose/nerdtree'                          " file explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " command line fuzzy finder
Plug 'junegunn/fzf.vim'                             " command line fuzzy finder
Plug 'rust-lang/rust.vim'                           " rust support
Plug 'plasticboy/vim-markdown'                      " markdown support
Plug 'euclio/vim-markdown-composer'                 " render markdown in the browser
Plug 'mattn/emmet-vim'                              " html completion
Plug 'rhysd/vim-clang-format'                       " c++ code formatting
Plug 'tell-k/vim-autopep8'                          " python code formatting
Plug 'prettier/vim-prettier'                        " javascript code formatting
Plug 'sheerun/vim-polyglot'                         " syntax support for many languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " code completion
Plug 'w0rp/ale'                                     " code linting
Plug 'SirVer/ultisnips'                             " code snippets
Plug 'airblade/vim-rooter'                          " look in root for file search

call plug#end()
filetype plugin on

"" settings

set hidden                                            " modified buffers in background
set backup                                            " backup files
set ignorecase                                        " ignore case in searches
set smartindent                                       " newline smart indent
set expandtab                                         " expand tabs to spaces by default
set ai                                                " auto indenting
set hlsearch                                          " highlight search terms
set ruler                                             " show the cursor position
set number                                            " show line numbers
set splitbelow                                        " splits happen below
set nofoldenable                                      " disable folding on file open
set undofile                                          " save undo history
set autochdir                                         " have vim set file dir to cwd
set autoread                                          " auto read changes files

set background                   =dark                " use a dark background
set foldmethod                   =marker              " allow for specification of folds
set shiftwidth                   =4                   " number of spaces to use for auto indenting
set tabstop                      =4                   " a tab is four spaces
set numberwidth                  =1                   " room used for line numbers
set backspace                    =indent,eol,start    " allow backspacing over everything in insert mode
set belloff                      =all                 " disable vim bell sounds
set mouse                        =a                   " allow mouse to set cursor position
set undodir                      =~/.vim/.vimdid      " backup directory location
set rtp                         +=/usr/local/opt/fzf  " set fzf rtp
set clipboard                    =unnamed             " use the system clipboard
set backupdir                    =~/.vim/backup       " set backup directory
set noerrorbells visualbell t_vb =                    " disable terminal bells

"" lettings

let mapleader                                          = "\<space>"                   " set space as leader key

let g:autopep8_on_save                                 = 1                            " format python file on save
let g:autopep8_disable_show_diff                       = 1                            " disable show diff window
let g:AutoPairsFlyMode                                 = 0                            " disable fly mode
let g:AutoPairsShortcutBackInsert                      = '<M-b>'                      " shortcut
let g:AutoPairsShortcutToggle                          = '<C-u>'                      " toggle autopairs
let g:fzf_command_prefix                               = 'Z'                          " set fzf command prefix to 'Z'
let g:goyo_width                                       = 150                          " set Goyo width
let g:goyo_height                                      = 90                           " set Goyo height
let g:NERDTreeWinPos                                   = "right"                      " always open nerdtree on right side
let NERDTreeMinimalUI                                  = 1                            " to remove the ? at the top
let g:gitgutter_enabled                                = 0                            " disable gitgutter by default
let g:user_emmet_leader_key                            = '<C-E>'                      " emmet completion, <C-E> + ','
let g:rustfmt_autosave                                 = 1                            " format rust code on save
let g:vim_markdown_conceal                             = 0                            " do not conceal blocks
let g:vim_markdown_conceal_code_blocks                 = 0                            " do not conceal code blocks
let g:markdown_folding                                 = 0                            " disable folding
let g:markdown_composer_autostart                      = 0                            " disable autostart in browser
let g:markdown_composer_syntax_theme                   = 'monokai'                    " set markdown codeblock theme
let g:ale_fix_on_save                                  = 1                            " allow for code fixing on save
let g:ale_set_highlights                               = 0                            " disable highlight setting
let g:ale_echo_msg_error_str                           = 'E'                          " set 'E' for error
let g:ale_echo_msg_warning_str                         = 'W'                          " set 'W' for warning
let g:ale_echo_msg_format                              = '[%linter%] %s [%severity%]' " set error message format
let g:fzf_layout                                       = { 'down': '~40%' }           " set fzf split to bottom
let g:UltiSnipsExpandTrigger                           = "<tab>"                      " expand snippet
let g:UltiSnipsJumpForwardTrigger                      = "<tab>"                      " jump forward in snippet
let g:UltiSnipsJumpBackwardTrigger                     = "<s-tab>"                    " jump backward in snippet
let g:UltiSnipsEditSplit                               = "horizontal"                 " split snippet edit horizontally
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "vim/ultisnips"              " default directory for ultisnips

"" mappings

" general
nnoremap Q <nop>|                                                  " map Q to nothing
nnoremap Z :wq<CR>|                                                " save and quit file
onoremap p i(|                                                     " for easier parens deletion
onoremap b i[|                                                     " for easier bracket deletion
onoremap in( :<C-U>normal! f(vi(<CR>|                              " hop into parens on same line
nnoremap<C-a> :ter<CR>|                                            " open terminal with ctrl + a
nnoremap<C-R> :%s/[^[:print:]]//g<CR>|                             " remove non printable characters
nnoremap ^ 0|
nnoremap 0 ^|

" tab switching
nnoremap <C-j> :tabprevious<CR>|                                   " prev tab
nnoremap <C-k> :tabnext<CR>|                                       " next tab
nnoremap <C-n> :tabnew<CR>|                                        " new tab
nnoremap <C-Q> :-tabmove<CR>|                                      " move tab left
nnoremap <C-P> :+tabmove<CR>|                                      " move tab right

" leader
nnoremap<leader>i gg=G<CR>|                                        " fix indentation
nnoremap<leader>p :Prettier<CR>|                                   " format code with prettier
nnoremap<leader>sv :source $MYVIMRC<CR>|                           " source vimrc
nnoremap<leader>ss :source %<CR>|                                  " source %
nnoremap<leader>tp :Goyo<CR>|                                      " toggle prose mode
nnoremap<leader>" viw<esc>a"<esc>bi"<esc>lel<CR>|                  " quotes around word
nnoremap<leader>rr :redo<CR>|                                      " redo last change
nnoremap<leader>qq ^<esc>D|                                        " clear line
nnoremap<leader>cl gg<esc>dG<CR>|                                  " clear file
nnoremap<leader>c :%y+<CR>|                                        " yank all line to +
nnoremap<leader>tg :GitGutterToggle<CR>|                           " toggle git gutter

" alignment
nnoremap <leader>a: :Tabularize /:<CR>|                            " align on :
nnoremap <leader>a= :Tabularize /=<CR>|                            " align on =
nnoremap <leader>a# :Tabularize /#<CR>|                            " align on #
vnoremap <leader>a" :Tabularize /"<CR>|                            " align on "
vnoremap <leader>a# :Tabularize /#<CR>|                            " align on #
vnoremap <leader>a= :Tabularize /=<CR>|                            " align on =
vnoremap <leader>a: :Tabularize /:<CR>|                            " align on :

" searching
nnoremap<leader>sf :ZFiles<CR>|                                    " search for files
nnoremap<leader>sa :AllLines<CR>|                                  " search through all lines in all files
nnoremap<leader>sg :ZCommits<CR>|                                  " search through git commits
nnoremap<leader>o :NERDTreeToggle<CR>|                             " toggle nerdtree

" edit named files
nnoremap<leader>ev :split ~/.vimrc<CR>|                            " edit vimrc
nnoremap<leader>ea :split ~/.aliases<CR>|                          " edit bash aliases
nnoremap<leader>en :e notes.md<CR>|                                " edit project notes
nnoremap<leader>es :UltiSnipsEdit<CR>|                             " edit ultisnips for current filetype

" we don't need arrow keys
nnoremap <up> <nop>|                                               " disable up in normal mode
nnoremap <down> <nop>|                                             " disable down in normal mode
inoremap <up> <nop>|                                               " disable up in ins mode
inoremap <down> <nop>|                                             " disable down in ins mode
inoremap <left> <nop>|                                             " disable left in ins mode
inoremap <right> <nop>|                                            " disable right in ins mode

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>| " stop trailing whitespace
nnoremap <silent> <C-L> :noh<CR><C-L>|                             " clear search highlighting

"" functions

function! JournalMode()
    execute 'normal gg'
    let filename = '#' . ' ' . expand('%:r')
    call setline(1, filename)
    execute 'normal o'
    execute 'Goyo'
endfunction

source ~/.vim/functions/cp.vim    " competitive programming related functions
source ~/.vim/functions/cocrc.vim " coc related functions

"" colors

if &t_Co > 2 || has("gui_running")
  syntax on
  set t_Co=256
  if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
      source ~/.vimrc_background
  endif
  :hi Error NONE
  hi Pmenu ctermbg=black ctermfg=white
  hi! CocErrorSign guifg=#d1666a
  hi! CocInfoSign guibg=#353b45
  hi! CocWarningSign guifg=#d1cd66
  hi! Comment ctermfg=green
endif

"" commands

command! -bang -nargs=* AllLines
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': ['--delimiter=:', '--nth=4..']}), <bang>0)

"" autocommands

augroup vimrc
    autocmd!

    " enable clang format autoformat on save
    autocmd FileType c,cpp ClangFormatAutoEnable

    " play nice with markdown
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

    " map composer start to <leader>m on markdown files
    autocmd FileType markdown map<leader>m :ComposerStart<CR>

    " disable terminal bells
    autocmd GUIEnter * set visualbell t_vb=

    " close template fold for cpp files
    autocmd BufNewFile,BufEnter *.cpp normal zM

    " load cpp template on file open 
    :autocmd BufNewFile *.cpp 0r ~/.vim/templates/cpp.skeleton

    " load basic python template on file open
    :autocmd BufNewFile *.py 0r ~/.vim/templates/python.skeleton

    " populate journal template 
    autocmd VimEnter */journal/** 0r ~/.vim/templates/journal.skeleton 

    " set header for current journal entry
    autocmd VimEnter */journal/** :call JournalMode() 
augroup end
