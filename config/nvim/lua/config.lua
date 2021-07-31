require 'plugins'

-- lualine

require('lualine').setup {
  options = { lower = true, theme = 'dracula' },
  section = { lualine_a = {{ 'mode', lower = false }}, lualine_b = { 'branch' }}
}

-- lsp

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "<space>f",                                  "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', '<C-k>',                                 '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D',                             '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>ca',                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e',                '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>q',                          '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>rn',                                     '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>wa',                       '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>wr',                    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', 'K',                                              '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '[d',                                  '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d',                                  '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gD',                                       '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd',                                        '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi',                                    '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr',                                        '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local servers = { "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- telescope

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },

    prompt_prefix      = "> ",
    selection_caret    = "> ",
    entry_prefix       = "  ",
    initial_mode       = "insert",
    selection_strategy = "reset",
    sorting_strategy   = "descending",
    layout_strategy    = "vertical",

    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },

    file_sorter          = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter       = require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend             = 0,
    brder                = {},
    borderchars          = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons       = false,
    use_less             = true,
    path_display         = {},
    set_env              = { ['COLORTERM'] = 'truecolor' },
    file_previewer       = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer       = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer     = require'telescope.previewers'.vim_buffer_qflist.new,

    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- treesitter

require "nvim-treesitter.configs".setup {
  playground = {
    enable          = true,
    disable         = {},
    updatetime      = 25,
    persist_queries = false,
    keybindings     = {
      toggle_query_editor       = 'o',
      toggle_hl_groups          = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes    = 'a',
      toggle_language_display   = 'I',
      focus_language            = 'f',
      unfocus_language          = 'F',
      update                    = 'R',
      goto_node                 = '<cr>',
      show_help                 = '?',
    },
  }
}
