require 'util'

local execute = vim.api.nvim_command

function setup_markdown()
  opt('o', 'colorcolumn', '81')
  opt('o', 'textwidth', 80)
  execute(':hi ColorColumn ctermbg=grey guibg=grey')
end
