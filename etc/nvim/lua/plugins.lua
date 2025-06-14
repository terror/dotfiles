local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})

    vim.fn.getchar()

    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Changes Vim working directory to the project root.
  {
    'airblade/vim-rooter',
    event = 'VeryLazy',
  },

  -- LSP Progress lualine component.
  'arkav/lualine-lsp-progress',

  -- Vim syntax for TOML.
  {
    'cespare/vim-toml',
    ft = { 'toml' },
  },

  -- EditorConfig plugin for Vim.
  {
    'editorconfig/editorconfig-vim',
    event = 'BufReadPre',
  },

  -- A statusline plugin written in pure lua.
  'hoob3rt/lualine.nvim',

  -- A completion plugin for neovim written in Lua.
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind.nvim',
    },
  },

  -- A markdown preview plugin for (neo)vim.
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },

  -- The fancy start screen for Vim.
  {
    'mhinz/vim-startify',
    event = 'VimEnter',
  },

  -- Quickstart configs for Nvim LSP.
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- A `nvim-cmp` source for neovim builtin LSP client.
      'hrsh7th/cmp-nvim-lsp',
      -- Vscode-like pictograms for neovim lsp completion items.
      'onsails/lspkind.nvim',
    },
  },

  -- A highly extendable fuzzy finder over lists.
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- File browser extension for telescope.nvim.
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  -- A `fzf` sorter implementation for telescope.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  -- Neovim Treesitter configurations and abstraction layer.
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
  },

  -- View treesitter information directly in Neovim.
  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
  },

  -- Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
  {
    'plasticboy/vim-markdown',
    ft = 'markdown',
  },

  -- The neovim tabline plugin.
  {
    'romgrk/barbar.nvim',
    event = 'BufAdd',
    dependencies = {
      -- Provides Nerd Font icons (glyphs) for use by neovim plugins.
      'kyazdani42/nvim-web-devicons',
    },
  },

  -- Syntax highlighting for OpenGL Shading Language.
  {
    'tikhomirov/vim-glsl',
    ft = { 'glsl', 'vert', 'frag', 'geom', 'tesc', 'tese', 'comp' },
  },

  -- A plugin that lets you comment stuff out.
  {
    'tpope/vim-commentary',
    keys = { 'gc', 'gcc', { 'gc', mode = 'v' } },
  },

  -- Portable package manager for Neovim.
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
  },

  -- Vim and Neovim plugin to reveal the commit messages under the cursor.
  {
    'rhysd/git-messenger.vim',
    cmd = 'GitMessenger',
    keys = '<Plug>(git-messenger)',
  },

  -- Syntax highlighting for `just`, the command runner.
  {
    'NoahTheDuke/vim-just',
    ft = { 'just' },
  },

  -- Syntax highlighting for janet.
  {
    'janet-lang/janet.vim',
    ft = { 'janet' },
  },

  -- GitHub Copilot integration in lua.
  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup()
    end,
  },

  -- A `nvim-cmp` source for GitHub Copilot.
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },

  -- Low latency typst preview for Neovim.
  {
    'chomosuke/typst-preview.nvim',
    version = 'v1.*',
    config = function()
      require('typst-preview').setup()
    end,
  },

  -- A Neovim plugin that provides a simple way to run and visualize code actions with Telescope.
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'LspAttach',
    config = function()
      require('tiny-code-action').setup()
    end,
  },

  -- A Neovim plugin that displays prettier diagnostic messages.
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    priority = 1000,
    event = 'LspAttach',
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = 'classic',
        transparent_bg = true,
        options = {
          multilines = {
            enabled = true,
            always_show = true,
          },
        },
      })
    end,
  },
})
