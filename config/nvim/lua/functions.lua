require 'util'

local execute = vim.api.nvim_command

function setup_markdown()
  opt('o', 'colorcolumn', '81')
  execute(':hi ColorColumn ctermbg=darkgrey guibg=darkgrey')
end
