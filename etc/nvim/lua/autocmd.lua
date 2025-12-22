require('functions')

augroup({
  vimrc = {
    -- Setup markdown environment
    {
      'VimEnter,BufEnter',
      '*.md',
      'lua setup_markdown()',
    },

    -- Disable visual bell
    {
      'GUIEnter',
      '*',
      'set visualbell t_vb=',
    },

    -- Add highlight on yank
    {
      'TextYankPost',
      '*',
      'silent! lua vim.highlight.on_yank({hl_group="IncSearch", timeout=200})',
    },

    -- Set `pyproject` filetype
    {
      'BufRead,BufNewFile',
      'pyproject.toml',
      'lua vim.bo.filetype = "pyproject"; vim.lsp.enable("pyproject_lsp")',
    },

    -- Enable spellcheck for git commit messages
    {
      'FileType',
      'gitcommit',
      'setlocal spell spelllang=en_us',
    },

    --- Apply diagnostic highlights on colorscheme change
    {
      'ColorScheme',
      '*',
      'lua apply_diagnostic_highlights()',
    },
  },
})

apply_diagnostic_highlights()
