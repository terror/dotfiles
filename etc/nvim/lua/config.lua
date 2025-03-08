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
    file_ignore_patterns = { 'node_modules', 'vendor', 'target' },
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
    'glsl',
    'go',
    'java',
    'javascript',
    'latex',
    'lua',
    'ocaml',
    'python',
    'rust',
    'scala',
    'tsx',
    'typescript',
    'zig',
  },
  highlight = {
    enable = true,
    disable = { "markdown" }
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

-- Setup just TS parser
require('tree-sitter-just').setup({})

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
-- │ Markdown Composer                                                          │
-- ╚────────────────────────────────────────────────────────────────────────────│

g.markdown_composer_autostart = 0
g.markdown_composer_syntax_theme = 'dark'
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
  client.server_capabilities.semanticTokensProvider = nil
  map('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<leader>s', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
end

local servers = {
  'bashls',
  'clangd',
  'gopls',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'ts_ls',
  'zls',
}

require('mason').setup()

require('mason-lspconfig').setup({
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
-- │ Luasnip                                                                    │
-- ╚────────────────────────────────────────────────────────────────────────────│

local luasnip = require('luasnip')

require('luasnip.loaders.from_snipmate').lazy_load()

luasnip.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
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
    { name = 'luasnip' },
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
  experimental = {
    ghost_text = true,
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
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
})

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Leap                                                                       │
-- ╚────────────────────────────────────────────────────────────────────────────│

local leap = require('leap')

leap.init_highlight(true)
leap.opts.special_keys.prev_group = '<bs>'
leap.opts.special_keys.prev_target = '<bs>'

vim.keymap.set({ 'n', 'x', 'o' }, 'M', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 'L', '<Plug>(leap-backward-to)')

require('leap.user').set_repeat_keys('<cr>', '<bs>')

-- ───────────────────────────────────────────────────────────────────────────-─╗
-- │ Zig                                                                        │
-- ╚────────────────────────────────────────────────────────────────────────────│

vim.g.zig_fmt_autosave = 0
