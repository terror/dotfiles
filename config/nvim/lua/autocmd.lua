require('functions')

augroup({
  vimrc = {
    {
      'VimEnter,BufNewFile,BufFilePre,BufRead',
      '*.md',
      'set filetype=markdown',
    },
    {
      'VimEnter,BufNewFile,BufFilePre,BufRead',
      '*.tex',
      'set filetype=tex',
    },
    {
      'FileType',
      'markdown',
      'map<leader>m :ComposerStart<CR>',
    },
    {
      'VimEnter,BufEnter',
      '*.md,*.tex',
      'lua setup_markdown()',
    },
    {
      'FileType',
      'python',
      'setlocal shiftwidth=2 softtabstop=2 expandtab',
    },
    {
      'GUIEnter',
      '*',
      'set visualbell t_vb=',
    },
    {
      'TextYankPost',
      '*',
      'silent! lua vim.highlight.on_yank(higroup="IncSearch", timeout=1000)',
    },
  },
})
