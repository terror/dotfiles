local scopes = { o = vim.o, b = vim.bo, w = vim.wo, g = vim.g }

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function opt(scope, key, value)
  scopes[scope][key] = value
end
