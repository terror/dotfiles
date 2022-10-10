require('util')

local execute = vim.api.nvim_command

function setup_markdown()
  execute(':setlocal textwidth=80')
  execute(':setlocal colorcolumn=81')
  execute(':setlocal spell')
  execute(':hi ColorColumn ctermbg=grey guibg=grey')
end

function strip(str)
  return str:gsub('\n', ''):gsub(' +$', ''):gsub('^ +', '')
end
