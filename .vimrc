set nocompatible
filetype off

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Plugins                                                                  ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

filetype plugin indent on
call plug#begin('~/.vim/plugged')

" general purpose plugins
Plug 'NoahTheDuke/vim-just'                               " justfile syntax highlighting
Plug 'SirVer/ultisnips'                                   " code snippets
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterToggle'}  " show git diff in the sign column
Plug 'airblade/vim-rooter'                                " look in root for file search
Plug 'chriskempson/base16-vim'                            " base16 colors in vim
Plug 'editorconfig/editorconfig-vim'                      " respect .editorconfig
Plug 'emonkak/vim-operator-sort'                          " sort operator
Plug 'euclio/vim-markdown-composer', {'for': 'markdown'}  " render markdown in the browser
Plug 'godlygeek/tabular', {'on': 'Tabularize'}            " text filtering and alignment
Plug 'jiangmiao/auto-pairs'                               " pair completion
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}         " command line fuzzy finder
Plug 'junegunn/fzf.vim'                                   " command line fuzzy finder
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}                  " distraction free writing
Plug 'junegunn/vim-easy-align'                            " easy alignment
Plug 'kana/vim-operator-user'                             " allow user defined operators
Plug 'luochen1990/rainbow'                                " rainbow delimiters
Plug 'machakann/vim-highlightedyank'                      " make the highlighted region apparent
Plug 'mattn/emmet-vim', {'for': 'html'}                   " html completion
Plug 'mattn/vim-gist', {'on': 'Gist'}                     " create gists
Plug 'mattn/webapi-vim'                                   " vim gist dependency
Plug 'mhinz/vim-startify'                                 " a fancy start screen
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}       " markdown support
Plug 'prettier/vim-prettier'                              " javascript code formatting
Plug 'rhysd/vim-clang-format'                             " c++ code formatting
Plug 'rust-lang/rust.vim', {'for': 'rust'}                " rust support
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}      " file explorer
Plug 'tpope/vim-commentary'                               " comment stuff out
Plug 'tpope/vim-eunuch'                                   " unix helpers
Plug 'tpope/vim-surround'                                 " all about surroundings
Plug 'w0rp/ale'                                           " code linting

" (may revive these later)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'sheerun/vim-polyglot'
" Plug 'terror/vim-crypto', {'do': 'cargo build --release'}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vimwiki/vimwiki'

call plug#end()
filetype plugin on

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Settings                                                                 ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

set ai                                  " auto indenting
set autochdir                           " have vim set file dir to cwd
set autoread                            " auto read changes files
set backup                              " backup files
set expandtab                           " expand tabs to spaces by default
set hidden                              " modified buffers in background
set hlsearch                            " highlight search terms
set ignorecase                          " ignore case in searches
set incsearch                           " hilight search matches while typing
set linebreak                           " avoid wrapping mid word
set noerrorbells                        " disable terminal bells
set nofoldenable                        " disable folding on file open
set number                              " show line numbers
set ruler                               " show the cursor position
set showcmd                             " show partial command and other useful stuff at bottom of screen
set smartcase                           " case insensitive searches unless contains uppercase
set smartindent                         " newline smart indent
set splitbelow                          " open horizontal splits below current buffer
set splitright                          " open vertical splits to the right of current buffer
set title                               " set title
set ttyfast                             " make updates smoother
set undofile                            " save undo history
set wrap                                " enable line wrapping

set background      =dark               " use a dark background
set backspace       =indent,eol,start   " allow backspacing over everything in insert mode
set backupdir       =~/.vim/backup      " set backup directory
set belloff         =all                " disable vim bell sounds
set clipboard       =unnamed            " use the system clipboard
set foldmethod      =marker             " allow for specification of folds
set mouse           =a                  " allow mouse to set cursor position
set numberwidth     =1                  " room used for line numbers
set rtp            +=/usr/local/opt/fzf " set fzf rtp
set shiftwidth      =2                  " number of spaces to use for auto indenting
set tabpagemax      =30                 " cap vim -p to 30 tabs
set tabstop         =2                  " a tab is two spaces
set textwidth       =120                " set text width
set undodir         =~/.vim/undo        " undo directory location
set visualbell t_vb =                   " disable beeping
set wildignore      =.pyc,.swp          " ignore when opening based on a glob pattern

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Lettings                                                                 ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

let mapleader                                          = "\<space>"                   " set space as leader key

let g:airline#extensions#tabline#buffers_label         = ''                           " rename label for buffers
let g:airline#extensions#tabline#enabled               = 1                            " enable enhanced tabline
let g:airline#extensions#tabline#fnamemod              = ':t'                         " disable file paths in a tab
let g:airline#extensions#tabline#show_buffers          = 1                            " show buffers in the tabline
let g:airline#extensions#tabline#show_close_button     = 0                            " remove close button
let g:airline#extensions#tabline#show_splits           = 0                            " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_count        = 0                            " dont show tab numbers on the right
let g:airline#extensions#tabline#show_tab_nr           = 0                            " disable tab numbers
let g:airline#extensions#tabline#show_tab_type         = 0                            " disable displaying the tab type
let g:airline#extensions#tabline#tabs_label            = ''                           " remove tabs label
let g:airline_detect_modified                          = 1                            " enable modified detection
let g:airline_left_sep                                 = ''                           " turn off left separator
let g:airline_powerline_fonts                          = 1                            " fixes missing whitespace in tabline
let g:airline_right_sep                                = ''                           " turn off right separator
let g:airline_skip_empty_sections                      = 1                            " hide empty sections
let g:airline_theme                                    = 'simple'                     " set airline theme

let g:AutoPairsFlyMode                                 = 0                            " disable fly mode
let g:AutoPairsShortcutBackInsert                      = '<M-b>'                      " shortcut
let g:AutoPairsShortcutToggle                          = '<C-u>'                      " toggle autopairs
let g:NERDTreeMinimalUI                                = 1                            " to remove the ? at the top
let g:NERDTreeWinPos                                   = 'right'                      " always open nerdtree on right side
let g:UltiSnipsEditSplit                               = 'horizontal'                 " split snippet edit horizontally
let g:UltiSnipsExpandTrigger                           = '<tab>'                      " expand snippet
let g:UltiSnipsJumpBackwardTrigger                     = '<s-tab>'                    " jump backward in snippet
let g:UltiSnipsJumpForwardTrigger                      = '<tab>'                      " jump forward in snippet
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = 'vim/ultisnips'              " default directory for ultisnips
let g:ale_echo_msg_error_str                           = 'E'                          " set 'E' for error
let g:ale_echo_msg_format                              = '[%linter%] %s [%severity%]' " set error message format
let g:ale_echo_msg_warning_str                         = 'W'                          " set 'W' for warning
let g:ale_fix_on_save                                  = 1                            " allow for code fixing on save
let g:ale_rust_rustfmt_options                         = '+nightly'                   " rust nightly formatting
let g:ale_set_highlights                               = 0                            " disable highlight setting
let g:fzf_command_prefix                               = 'Z'                          " set fzf command prefix to 'Z'
let g:fzf_layout                                       = { 'down': '~40%' }           " set fzf split to bottom
let g:gist_clip_command                                = 'pbcopy'                     " copy gist code
let g:gist_detect_filetype                             = 1                            " detect gist filetype from filename
let g:gist_open_browser_after_post                     = 1                            " open browser after gist post
let g:gist_post_private                                = 1                            " default to private gists
let g:gist_show_privates                               = 1                            " show private gists with Gist -l
let g:gitgutter_enabled                                = 0                            " disable gitgutter by default
let g:goyo_height                                      = 90                           " set Goyo height
let g:goyo_width                                       = 150                          " set Goyo width
let g:highlightedyank_highlight_duration               = 1000                         " set yank highlighting to 1 second
let g:markdown_composer_autostart                      = 0                            " disable autostart in browser
let g:markdown_composer_syntax_theme                   = 'monokai'                    " set markdown codeblock theme
let g:markdown_folding                                 = 0                            " disable folding
let g:rainbow_active                                   = 1                            " enable rainbow delimiters
let g:rust_clip_command                                = 'pbcopy'                     " used when copying rust playpen url
let g:rustfmt_autosave                                 = 1                            " format rust code on save
let g:user_emmet_leader_key                            = '<C-E>'                      " emmet completion, <C-E> + ','
let g:vim_markdown_conceal                             = 0                            " do not conceal blocks
let g:vim_markdown_conceal_code_blocks                 = 0                            " do not conceal code blocks
let g:vimwiki_markdown_link_ext                        = 1                            " set external md links

" check for airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.dirty = '…'

" set custom wiki2html script
let g:vimwiki_custom_wiki2html = $HOME.'/.vim/autoload/vimwiki/customwiki2html.sh'

" ale fixers
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'rust': ['rustfmt'],
\}

" vim wiki config
let g:vimwiki_list = [{
  \ 'path': '~/Github/wiki',
  \ 'syntax': 'markdown',
  \ 'ext': '.md'
\}]

" startify bookmarks
let  g:startify_bookmarks =  [
  \ {'v': '~/dotfiles/.vimrc'},
  \ {'a': '~/dotfiles/.aliases'},
  \ {'f': '~/dotfiles/.functions'},
\ ]

" startify custom commands
let g:startify_commands = [
  \ {'ch': ['Health Check', ':checkhealth']},
  \ {'ps': ['Plugins status', ':PlugStatus']},
  \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
  \ {'uc': ['Update coc Plugins', ':CocUpdate']},
  \ {'h': ['Help', ':help']},
\ ]

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Mappings                                                                 ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

" general remappings
nnoremap 0 ^|                                                      " hope to beginning using 0
nnoremap <C-R> :%s/[^[:print:]]//g<CR>|                            " remove non printable characters
nnoremap <C-a> :ter<CR>|                                           " open terminal with ctrl + a
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>| " remove trailing whitespace
nnoremap <silent> <C-L> :noh<CR><C-L>|                             " clear search highlighting
nnoremap Q <nop>|                                                  " map Q to nothing
nnoremap Z :wq<CR>|                                                " save and quit file
nnoremap ^ 0|                                                      " hope to beginning using 0
onoremap b i[|                                                     " for easier bracket deletion
onoremap in( :<C-U>normal! f(vi(<CR>|                              " hop into parens on same line
onoremap p i(|                                                     " for easier parens deletion

" tabs and buffers
nnoremap <C-P> :+tabmove<CR>|                                      " move tab right
nnoremap <C-Q> :-tabmove<CR>|                                      " move tab left
nnoremap <C-j> :bp<CR>|                                            " prev buffer
nnoremap <C-k> :bn<CR>|                                            " next buffer
nnoremap <C-n> :tabnew<CR>|                                        " new tab

" general leader mappings
nnoremap <leader><leader> <c-^>|                                    " toggle between buffers
nnoremap <leader>ad :ALEDetail<CR>|                                 " see ale error message details
nnoremap <leader>bu :.,$-bd<CR>|                                    " delete buffers from curr to last
nnoremap <leader>c :%y+<CR>|                                        " yank all line to +
nnoremap <leader>cl gg<esc>dG<CR>|                                  " clear file
nnoremap <leader>qq ^<esc>D|                                        " clear line
nnoremap <leader>r :redo<CR>|                                       " redo last change
nnoremap <leader>ss :source %<CR>|                                  " source %
nnoremap <leader>sv :source $MYVIMRC<CR>|                           " source vimrc
nnoremap <leader>tg :GitGutterToggle<CR>|                           " toggle git gutter
nnoremap <leader>tp :Goyo<CR>|                                      " toggle prose mode

" easy align
nmap ga <Plug>(EasyAlign)|                                         " start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)|                                         " start interactive EasyAlign for a motion/text object

" surround
map<leader>" ysiw"|                                                " quotes around word
map<leader>( ysiw(|                                                " parens around word
map<leader>[ ysiw[|                                                " brackets around word
map<leader>{ ysiw{|                                                " braces around word

" formatting and alignment
map <leader>os <plug>(operator-sort)|                              " sort operator
nnoremap <leader>a# :Tabularize /#<CR>|                            " align on #
nnoremap <leader>a: :Tabularize /:<CR>|                            " align on :
nnoremap <leader>a= :Tabularize /=<CR>|                            " align on =
nnoremap <leader>i gg=G<CR>|                                       " fix indentation
nnoremap <leader>p :Prettier<CR>|                                  " format code with prettier
vnoremap <leader>a" :Tabularize /"<CR>|                            " align on "
vnoremap <leader>a# :Tabularize /#<CR>|                            " align on #
vnoremap <leader>a: :Tabularize /:<CR>|                            " align on :
vnoremap <leader>a= :Tabularize /=<CR>|                            " align on =
vnoremap <leader>s  :sort<cr>|                                     " sort lines

" searching
nnoremap <C-s> :ZFiles<CR>|                                        " search for files
nnoremap<leader>o :NERDTreeToggle<CR>|                             " toggle nerdtree
nnoremap<leader>sa :AllLines<CR>|                                  " search through all lines in all files
nnoremap<leader>sb :ZBuffers<CR>|                                  " search through open buffers
nnoremap<leader>sg :ZCommits<CR>|                                  " search through git commits

" edit named files
nnoremap<leader>ea :split ~/.aliases<CR>|                          " edit bash aliases
nnoremap<leader>en :e notes.md<CR>|                                " edit project notes
nnoremap<leader>es :UltiSnipsEdit<CR>|                             " edit ultisnips for current filetype
nnoremap<leader>ev :split ~/.vimrc<CR>|                            " edit vimrc

" we don't need arrow keys
inoremap <down>  <nop>|                                            " disable down in ins mode
inoremap <left>  <nop>|                                            " disable left in ins mode
inoremap <right> <nop>|                                            " disable right in ins mode
inoremap <up>    <nop>|                                            " disable up in ins mode
nnoremap <down>  <nop>|                                            " disable down in normal mode
nnoremap <up>    <nop>|                                            " disable up in normal mode

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Functions                                                                ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

function! JournalMode()
  execute 'normal gg'
  let filename = '#' . ' ' . expand('%:r')
  call setline(1, filename)
  execute 'normal o'
  execute 'Goyo'
endfunction

function! OnMdCreate()
  execute 'normal gg'
  let filename = '##' . ' ' . expand('%:t:r')
  call setline(1, filename)
  execute 'normal o'
endfunction

function! SetupMd()
  setlocal colorcolumn=81
  :hi ColorColumn ctermbg=darkgrey guibg=darkgrey
endfunction

function! AdjustTextWidth()
  let syn_element = synIDattr(synID(line("."), col(".") - 1, 1), "name")
  let &textwidth = syn_element =~? 'comment' ? 72 : 79
  echo "tw = " . &textwidth
endfunction

" `CargoCommand` allows for the running of a cargo `C*` command
" in rust projects located within subdirectories by passing in the path
" to the closest `Cargo.toml` file outside of the current buffers directory
" but within bounds of the projects root directory.
"
" Note: commands in the `Commands` section should be added if
" any other `C*` commands are wished to be ran in subdirectories.

function! CargoCommand(cmd)
py3 << EOF
import os, vim

def main():
  # Grab the projects root
  # Note:
  #  `vim-rooter` must be installed for `os.getcwd()` to return the projects root.
  root      = os.path.join(os.getcwd(), 'Cargo.toml')
  curr      = os.path.abspath(os.path.join(vim.eval('expand("%:p")'), '..'))
  candidate = os.path.join(curr, 'Cargo.toml')

  # Walk backwards looking for a `Cargo.toml` file.
  while candidate != root:
    candidate = os.path.join(curr, 'Cargo.toml')
    if os.path.exists(candidate):
      vim.command(f'{vim.eval("a:cmd")} --manifest-path={candidate}')
      return
    curr = os.path.abspath(os.path.join(curr, '..'))

  print('`Cargo.toml` was not found.')
main()
EOF
endfunction

source ~/.vim/functions/cp.vim    " competitive programming related functions
source ~/.vim/functions/cocrc.vim " coc related functions

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Colors                                                                   ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

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

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Commands                                                                 ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

command! -bang -nargs=* AllLines
\ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': ['--delimiter=:', '--nth=4..']}), <bang>0)

command! -bang -nargs=0 Cr
\ call CargoCommand('Crun')

command! -bang -nargs=0 Ct
\ call CargoCommand('Ctest')

command! -bang -nargs=0 Cb
\ call CargoCommand('Cbuild')

" ─────────────────────────────────────────────────────────────────────────────│─╗
" │ Autocommands                                                             ─╬─│┼
" ╚────────────────────────────────────────────────────────────────────────────│──

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
  autocmd BufNewFile *.cpp 0r ~/.vim/templates/cpp.skeleton

  " load basic python template on file open
  autocmd BufNewFile *.py 0r ~/.vim/templates/python.skeleton

  " set python code style
  autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab

  " populate journal template
  autocmd VimEnter */journal/** 0r ~/.vim/templates/journal.skeleton

  " set header for current journal entry
  autocmd VimEnter */journal/** :call JournalMode()

  " set title as filename for new markdown files
  autocmd BufNewFile *.md :call OnMdCreate()

  " prettier hack for .tsx files
  autocmd BufNewFile,BufRead *.tsx setf typescript.tsx

  " adjust comment text width
  autocmd TextChanged,TextChangedI * :call AdjustTextWidth()

  " set color column in `.md` files
  autocmd VimEnter,BufEnter *.md call SetupMd()
augroup end
