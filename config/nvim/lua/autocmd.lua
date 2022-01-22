require("functions")

augroup({
  vimrc = {
    -- Set the current filetype as `markdown` upon entering `.md` files
    {
      "VimEnter,BufNewFile,BufFilePre,BufRead",
      "*.md",
      "set filetype=markdown",
    },

    -- Map <leader>m to open the markdown preview
    {
      "FileType",
      "markdown",
      "map<leader>m :ComposerStart<CR>",
    },

    -- Setup the markdown environment for writing
    {
      "VimEnter,BufEnter",
      "*.md",
      "lua setup_markdown()",
    },

    -- Set my preferred python code style upon entering the `Python` filetype
    {
      "FileType",
      "python",
      "setlocal shiftwidth=2 softtabstop=2 expandtab",
    },

    -- Disable beeping on all file types
    {
      "GUIEnter",
      "*",
      "set visualbell t_vb=",
    },

    -- Essentially does what the highlighted-yank plugin was created for,
    -- highlights yanks for 1 second
    {
      "TextYankPost",
      "*",
      'silent! lua vim.highlight.on_yank(higroup="IncSearch", timeout=1000)',
    },
  },
})
