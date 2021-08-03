require 'util'
require 'functions'

augroup({
  vimrc = {
    { 'BufNewFile,BufFilePre,BufRead *.md set filetype=markdown'                            },
    { 'FileType markdown map<leader>m :ComposerStart<CR>'                                   },
    { 'FileType python setlocal shiftwidth=2 softtabstop=2 expandtab'                       },
    { 'GUIEnter * set visualbell t_vb='                                                     },
    { 'TextYankPost * silent! lua vim.highlight.on_yank(higroup="IncSearch", timeout=1000)' },
    { 'VimEnter,BufEnter *.md lua setup_markdown()'                                         }
  }
})
