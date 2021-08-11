require 'plugins'
require 'util'

local g = vim.g

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Lualine                                                                   ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

require('lualine').setup {
  options = {
    lower         = true,
    theme         = 'ayu_mirage',
    icons_enabled = false
  },
  section = {
    lualine_a = { 'mode', lower = false },
    lualine_b = { 'branch' }
  }
}

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Telescope                                                                 ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

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
      horizontal = { mirror = false },
      vertical   = { mirror = false },
    },

    borderchars            = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    brder                  = {},
    color_devicons         = true,
    file_ignore_patterns   = {},
    path_display           = {},
    set_env                = { ['COLORTERM'] = 'truecolor' },
    use_less               = true,
    winblend               = 0,

    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
    file_previewer         = require('telescope.previewers').vim_buffer_cat.new,
    file_sorter            = require('telescope.sorters').get_fuzzy_file,
    generic_sorter         = require('telescope.sorters').get_generic_fuzzy_sorter,
    grep_previewer         = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer       = require('telescope.previewers').vim_buffer_qflist.new
  }
}

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Treesitter                                                                ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "rust",
    "python",
    "lua"
  },

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

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Barbar                                                                    ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

g.bufferline = {
  animation               = false,
  auto_hide               = false,
  tabpages                = true,
  closable                = true,
  clickable               = true,
  icons                   = true,
  icon_separator_active   = '',
  icon_separator_inactive = '',
  icon_close_tab          = '',
  icon_close_tab_modified = '●',
  icon_pinned             = '車',
  maximum_padding         = 1,
  maximum_length          = 30,
  semantic_letters        = true,
  letters                 = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title           = nil,
}

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Startify                                                                  ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

g.startify_custom_header = {
  '',
  '',
  '                                                         ██            ',
  '                                                        ░░             ',
  '                      ███████   █████   ██████  ██    ██ ██ ██████████ ',
  '                     ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██',
  '                      ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██',
  '                      ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██',
  '                      ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██',
  '                     ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░ ',
  '',
  '',
}

g.startify_bookmarks = {
  { v = '~/dotfiles/config/nvim/init.lua' },
  { a = '~/dotfiles/.aliases'             },
  { f = '~/dotfiles/.functions'           }
}

g.startify_commands = {
  { ch = { 'Health Check', ':checkhealth' }          },
  { ps = { 'Plugin sync', ':PackerSync' }            },
  { pu = { 'Update neovim plugins',':PackerUpdate' } },
  { h  = { 'Help', ':help' }                         }
}

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ ALE                                                                       ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

g.ale_echo_msg_error_str   = 'E'
g.ale_echo_msg_format      = '[%linter%] %s [%severity%]'
g.ale_echo_msg_warning_str = 'W'
g.ale_fix_on_save          = 1
g.ale_rust_rustfmt_options = '+nightly'
g.ale_set_highlights       = 0

g.ale_fixers = {
  { rust = { 'rustfmt' } }
}

g.rustfmt_autosave         = 1

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Markdown                                                                  ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

g.markdown_composer_autostart       = 0
g.markdown_composer_syntax_theme    = 'monokai'
g.markdown_folding                  = 0
g.vim_markdown_auto_insert_bullets  = 0
g.vim_markdown_conceal              = 0
g.vim_markdown_conceal_code_blocks  = 0
g.vim_markdown_new_list_item_indent = 0

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Autopairs                                                                 ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

require('nvim-autopairs').setup()

local npairs = require('nvim-autopairs')

_G.MUtils = {}

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end

map('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true , noremap = true })

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Netrw                                                                     ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

g.netrw_altv         = 1
g.netrw_banner       = 0
g.netrw_browse_split = 4
g.netrw_liststyle    = 3
g.netrw_winsize      = 20
