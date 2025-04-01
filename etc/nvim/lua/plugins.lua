local execute = vim.api.nvim_command

local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  execute('packadd packer.nvim')
end

local use = require('packer').use

return require('packer').startup(function()
  --  Changes Vim working directory to project root
  use('airblade/vim-rooter')

  -- View LSP startup progress
  use('arkav/lualine-lsp-progress')

  -- Toml syntax
  use('cespare/vim-toml')

  -- Support .editorconfig
  use('editorconfig/editorconfig-vim')

  -- Preview markdown files in the browser
  use({
    'euclio/vim-markdown-composer',
    cmd = 'ComposerStart',
    ft = 'markdown',
    run = 'cargo build --release --locked',
  })

  -- Statusline
  use('hoob3rt/lualine.nvim')

  -- LSP source for nvim-cmp
  use('hrsh7th/cmp-nvim-lsp')

  -- Autocompletion plugin
  use('hrsh7th/nvim-cmp')

  -- Icons for status and tabline
  use('kyazdani42/nvim-web-devicons')

  -- A lua-based snippet engine
  use({ 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*' })

  -- Cool start screen
  use('mhinz/vim-startify')

  -- Language server protocol
  use('neovim/nvim-lspconfig')

  -- Telescope file browser
  use('nvim-telescope/telescope-file-browser.nvim')

  -- Use FZF for telescope fuzzy file finding algorithm
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Fuzzy file finder
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
  })

  -- Support for treesitter
  use('nvim-treesitter/nvim-treesitter')

  -- Treesitter playground
  use({ 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' })

  -- Cool vscode-like pictograms
  use('onsails/lspkind.nvim')

  -- Markdown syntax support
  use({ 'plasticboy/vim-markdown', ft = 'markdown' })

  -- Tabline
  use('romgrk/barbar.nvim')

  -- Rust support
  use({ 'rust-lang/rust.vim', ft = 'rust' })

  -- Snippets source for nvim-cmp
  use('saadparwaiz1/cmp_luasnip')

  -- GLSL syntax highlighting
  use('tikhomirov/vim-glsl')

  -- Comment stuff out
  use('tpope/vim-commentary')

  -- Package manager
  use('wbthomason/packer.nvim')

  -- Automated LSP server installation
  use({ 'williamboman/mason-lspconfig.nvim', 'williamboman/mason.nvim' })

  -- See commit information on hover
  use({ 'rhysd/git-messenger.vim' })

  -- Syntax highlighting for justfiles
  --
  -- n.b. This is better than the highlighting that we currently get
  -- from the tree-sitter just parser.
  use({ 'NoahTheDuke/vim-just', ft = { 'just' } })

  -- Github copilot
  use({
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup({
        panel = { enabled = false },
        suggestion = { enabled = false },
      })
    end,
  })

  -- Github copilot cmp integration
  use({
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  })

  -- LLM integration
  use({
    'frankroeder/parrot.nvim',
    dependencies = {
      'ibhagwan/fzf-lua',
      'nvim-lua/plenary.nvim',
      'folke/noice.nvim',
    },
    config = function()
      require('parrot').setup({
        providers = {
          anthropic = {
            api_key = os.getenv('ANTHROPIC_API_KEY'),
          },
          ollama = {},
          openai = {
            api_key = os.getenv('OPENAI_API_KEY'),
          },
          xai = {
            api_key = os.getenv('XAI_API_KEY'),
          },
        },
      })
    end,
  })

  -- Markup-based typesetting system live previews
  use({
    'chomosuke/typst-preview.nvim',
    tag = 'v1.*',
    config = function()
      require('typst-preview').setup({})
    end,
  })

  -- Better view for LSP code actions
  use({
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    event = "LspAttach",
    config = function()
      require('tiny-code-action').setup()
    end,
  })

  -- Better view for LSP diagnostics
  use({
    "rachartier/tiny-inline-diagnostic.nvim",
    priority = 1000,
    event = "LspAttach",
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = "classic",
        transparent_bg = true,
        options = {
          multilines = {
            enabled = true,
            always_show = true,
          },
        }
      })
    end,
  })
end)
