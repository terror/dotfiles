require('util')

function apply_diagnostic_highlights()
  local hl = vim.api.nvim_set_hl

  hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = '#Cd3f45' })
  hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = '#a074c4' })
  hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = '#55b5db' })
  hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = '#e6cd69' })
end

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
