require('plugins')
require('util')

local g = vim.g

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Telescope                                                                  │
-- ╚────────────────────────────────────────────────────────────────────────────│

local telescope = require('telescope')

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },

    prompt_prefix = '> ',
    selection_caret = '> ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'vertical',

    layout_config = {
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },

    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    brder = {},
    color_devicons = true,
    file_ignore_patterns = {},
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' },
    use_less = true,
    winblend = 0,

    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },
})

-- Load all extensions
local extensions = { 'file_browser' }
for _, extension in ipairs(extensions) do
  telescope.load_extension(extension)
end

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Treesitter                                                                 │
-- ╚────────────────────────────────────────────────────────────────────────────│

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'rust',
    'python',
    'lua',
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
})

-- Setup just TS parser
require('tree-sitter-just').setup({})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Bufferline                                                                 │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.bufferline = {
  animation = false,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = true,
  icon_separator_active = '',
  icon_separator_inactive = '',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Startify                                                                   │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.startify_custom_header = {
  '',
  '',
  '                                                            ',
  '                                        ░░                  ',
  '      ███████   █████   ██████  ██    ██ ██ ██████████      ',
  '     ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██     ',
  '      ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██     ',
  '      ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██     ',
  '      ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██     ',
  '     ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░      ',
  '',
  '',
}

g.startify_bookmarks = {
  { v = '~/dotfiles/config/nvim/init.lua' },
  { a = '~/dotfiles/.aliases' },
  { f = '~/dotfiles/.functions' },
}

g.startify_commands = {
  { ch = { 'Health Check', ':checkhealth' } },
  { ps = { 'Plugin sync', ':PackerSync' } },
  { pu = { 'Update neovim plugins', ':PackerUpdate' } },
  { h = { 'Help', ':help' } },
}

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Ale                                                                        │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.ale_echo_msg_error_str = 'E'
g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
g.ale_echo_msg_warning_str = 'W'
g.ale_fix_on_save = 1
g.ale_rust_rustfmt_options = '+nightly'
g.ale_set_highlights = 0

g.ale_fixers = {
  { rust = { 'rustfmt' } },
}

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Rustfmt                                                                    │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.rustfmt_autosave = 0

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Markdown Composer                                                          │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.markdown_composer_autostart = 0
g.markdown_composer_syntax_theme = 'monokai'
g.markdown_folding = 0
g.vim_markdown_auto_insert_bullets = 0
g.vim_markdown_conceal = 0
g.vim_markdown_conceal_code_blocks = 0
g.vim_markdown_new_list_item_indent = 0

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Autopairs                                                                  │
-- ╚────────────────────────────────────────────────────────────────────────────│

require('nvim-autopairs').setup()

local npairs = require('nvim-autopairs')

_G.MUtils = {}

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc('<cr>')
  else
    return npairs.autopairs_cr()
  end
end

map(
  'i',
  '<CR>',
  'v:lua.MUtils.completion_confirm()',
  { expr = true, noremap = true }
)

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Netrw                                                                      │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.netrw_altv = 1
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_liststyle = 3
g.netrw_winsize = 20

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ LSP                                                                        │
-- ╚────────────────────────────────────────────────────────────────────────────│

local lsp = require('lspconfig')

local on_attach = function(client)
  map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
end

local servers = { 'rust_analyzer', 'pyright' }
for _, server in ipairs(servers) do
  lsp[server].setup({
    on_attach = on_attach,
    handlers = {
      ['textDocument/publishDiagnostics'] = function() end,
    },
    settings = {
      [server] = {
        diagnostics = { disabled = { 'inactive-code' } },
      },
    },
  })
end

local configs = require('lspconfig.configs')

if not configs.just_lsp then
  configs.just_lsp = {
    default_config = {
      cmd = { '/Users/liam/src/just-lsp/bin/start' },
      filetypes = { 'just' },
      root_dir = function(name)
        return lsp.util.find_git_ancestor(name)
      end,
      settings = {},
    },
  }
end

lsp.just_lsp.setup({})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Lualine                                                                    │
-- ╚────────────────────────────────────────────────────────────────────────────│

require('lualine').setup({
  options = {
    lower = true,
    theme = 'ayu_mirage',
    icons_enabled = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'filename', 'diff' },
    lualine_c = { 'lsp_progress' },
  },
})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Ultisnips                                                                  │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.UltiSnipsExpandTrigger = '<tab>'
g.UltiSnipsJumpBackwardTrigger = '<c-z>'
g.UltiSnipsJumpForwardTrigger = '<c-b>'
