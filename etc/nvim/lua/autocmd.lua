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
      'map<leader>m :MarkdownPreview<CR>',
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
      'silent! lua vim.highlight.on_yank({hl_group="IncSearch", timeout=200})',
    },
  },
})
