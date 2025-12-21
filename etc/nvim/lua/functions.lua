require('util')

function setup_markdown()
  vim.opt_local.textwidth = 80

  vim.opt_local.spell = true
  vim.opt_local.wrap = true
  vim.opt_local.linebreak = true

  vim.keymap.set(
    'n',
    '<leader>m',
    '<cmd>MarkdownPreview<CR>',
    { buffer = true, silent = true, desc = 'Markdown Preview' }
  )
end

function strip(str)
  return str:gsub('\n', ''):gsub(' +$', ''):gsub('^ +', '')
end
