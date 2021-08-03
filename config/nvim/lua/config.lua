require 'plugins'

-- lualine

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
      horizontal = { mirror = false },
      vertical   = { mirror = false },
    },

    borderchars            = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    brder                  = {},
    color_devicons         = false,
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

-- treesitter

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

-- autopairs

require('nvim-autopairs').setup()
