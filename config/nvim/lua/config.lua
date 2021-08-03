require 'plugins'

-- ─────────────────────────────────────────────────────────────────────────────│─╗
-- │ Lualine                                                                   ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

require('lualine').setup {
  options = {
    lower         = true,
    theme         = 'dracula',
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

vim.g.bufferline = {
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
-- │ Autopairs                                                                 ─╬─│┼
-- ╚────────────────────────────────────────────────────────────────────────────│──

require('nvim-autopairs').setup()
