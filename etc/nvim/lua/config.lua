require('plugins')
require('util')

local g = vim.g

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Telescope                                                                  │
-- ╚────────────────────────────────────────────────────────────────────────────│

local telescope = require('telescope')

local extensions = { 'file_browser', 'fzf' }

for _, extension in ipairs(extensions) do
  telescope.load_extension(extension)
end

local dropdown = {
  theme = 'dropdown',
  previewer = false,
  layout_config = { height = 0.5, width = 0.8 },
}

local ivy = {
  theme = 'ivy',
  previewer = false,
  border = false,
  layout_config = { height = 10 },
}

telescope.setup({
  defaults = {
    prompt_prefix = ' ',
    file_ignore_patterns = {
      'node_modules',
      'submodules',
      'target',
      'vendor',
    },
  },
  pickers = {
    buffers = dropdown,
    file_browser = ivy,
    find_files = dropdown,
    git_files = dropdown,
    lsp_references = ivy,
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Treesitter                                                                 │
-- ╚────────────────────────────────────────────────────────────────────────────│

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'clojure',
    'cpp',
    'gleam',
    'glsl',
    'go',
    'java',
    'javascript',
    'just',
    'latex',
    'lua',
    'ocaml',
    'python',
    'rust',
    'scala',
    'tsx',
    'typescript',
    'typst',
    'zig',
  },
  highlight = {
    enable = true,
    disable = { 'markdown', 'just' },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<cr>',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
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

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Bufferline                                                                 │
-- ╚────────────────────────────────────────────────────────────────────────────│

require('barbar').setup({
  animation = false,
  hide = { extensions = false, inactive = false },
  icons = {
    button = '×',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = false, icon = 'ﬀ' },
      [vim.diagnostic.severity.WARN] = { enabled = false },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = false },
    },
    filetype = { custom_colors = false, enabled = true },
    separator = { left = '', right = '' },
    modified = { button = '●' },
    pinned = { button = '車' },
    alternate = { filetype = { enabled = false } },
    current = { buffer_index = false },
    inactive = { button = '×' },
    visible = { modified = { buffer_number = false } },
  },
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  maximum_length = 30,
  maximum_padding = 1,
  minimum_padding = 1,
  no_name_title = nil,
})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Startify                                                                   │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.startify_custom_header = {
  '                                                            ',
  '                                                            ',
  '                                                            ',
  '                                        ░░                  ',
  '      ███████   █████   ██████  ██    ██ ██ ██████████      ',
  '     ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██     ',
  '      ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██     ',
  '      ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██     ',
  '      ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██     ',
  '     ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░      ',
  '                                                            ',
  '                                                            ',
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
-- │ Markdown                                                                   │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.markdown_folding = 0
g.vim_markdown_auto_insert_bullets = 0
g.vim_markdown_conceal = 0
g.vim_markdown_conceal_code_blocks = 0
g.vim_markdown_new_list_item_indent = 0

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
  client.server_capabilities.semanticTokensProvider = nil

  map('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<leader>s', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')

  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

  vim.keymap.set('n', 'gd', function()
    require('telescope.builtin').lsp_definitions()
  end, { noremap = true, silent = true })

  vim.keymap.set('n', 'gi', function()
    require('telescope.builtin').lsp_implementations()
  end, { noremap = true, silent = true })

  vim.keymap.set('n', 'gr', function()
    require('telescope.builtin').lsp_references()
  end, { noremap = true, silent = true })

  vim.keymap.set('n', '<leader>ca', function()
    require('tiny-code-action').code_action()
  end, { noremap = true, silent = true })
end

local servers = {
  'bashls',
  'clangd',
  'gopls',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'tinymist',
  'ts_ls',
  'yamlls',
  'zls',
}

require('mason').setup()

require('mason-lspconfig').setup({
  automatic_enable = false,
  automatic_installation = true,
  ensure_installed = servers,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs(servers) do
  lsp[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lsp.java_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
    allow_incremental_sync = true,
  },
  handlers = {
    ['client/registerCapability'] = function(err, result, ctx, config)
      return vim.lsp.handlers['client/registerCapability'](err, {
        registrations = { result },
      }, ctx, config)
    end,
  },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {},
      },
    },
  },
})

local configs = require('lspconfig.configs')

if not configs.just_lsp then
  configs.just_lsp = {
    default_config = {
      cmd = { '/Users/liam/src/just-lsp/target/debug/just-lsp' },
      filetypes = { 'just' },
      root_dir = function(fname)
        return lsp.util.find_git_ancestor(fname)
      end,
      settings = {},
    },
  }
end

lsp.just_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Lualine                                                                    │
-- ╚────────────────────────────────────────────────────────────────────────────│

require('lualine').setup({
  options = {
    icons_enabled = true,
    lower = true,
    theme = 'ayu_mirage',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'filename', 'diff' },
    lualine_c = { 'lsp_progress' },
  },
})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Completion                                                                 │
-- ╚────────────────────────────────────────────────────────────────────────────│

local colors = {
  bg = '#151718',
  fg = '#d6d6d6',
  green = '#55dbbe',
  red = '#f23d3d',
  blue = '#66d9ee',
  yellow = '#dcdb86',
  cyan = '#ac80a6',
  purple = '#9a859d',
}

local commands = {
  'autocmd ColorScheme * hi! CmpItemAbbr guifg=' .. colors.fg,
  'autocmd ColorScheme * hi! CmpItemAbbrDeprecated guifg=' .. colors.red,
  'autocmd ColorScheme * hi! CmpItemAbbrMatch guifg=' .. colors.blue,
  'autocmd ColorScheme * hi! CmpItemAbbrMatchFuzzy guifg=' .. colors.yellow,
  'autocmd ColorScheme * hi! CmpItemKind guifg=' .. colors.green,
  'autocmd ColorScheme * hi! CmpItemMenu guifg=' .. colors.purple,
}

for _, command in pairs(commands) do
  vim.api.nvim_command(command)
end

local cmp = require('cmp')

local copilot_ok, copilot = pcall(require, 'copilot.suggestion')

cmp.setup({
  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
  },
  formatting = {
    format = function(_, item)
      item.kind = require('lspkind').presets.default[item.kind]
      return item
    end,
  },
  completion = {
    keyword_length = 1,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-l>'] = cmp.mapping(function(fallback)
      if copilot_ok and copilot.is_visible() then
        copilot.next()
      else
        fallback()
      end
    end, { 'i' }),
    ['<C-h>'] = cmp.mapping(function(fallback)
      if copilot_ok and copilot.is_visible() then
        copilot.prev()
      else
        fallback()
      end
    end, { 'i' }),
    ['<C-y>'] = cmp.mapping(function(fallback)
      if copilot_ok and copilot.is_visible() then
        copilot.dismiss()
      else
        fallback()
      end
    end, { 'i' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Zig                                                                        │
-- ╚────────────────────────────────────────────────────────────────────────────│

vim.g.zig_fmt_autosave = 0
