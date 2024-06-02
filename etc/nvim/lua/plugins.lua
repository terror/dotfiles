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

  -- Support .editorconfig
  use('editorconfig/editorconfig-vim')

  -- Cool start screen
  use('mhinz/vim-startify')

  -- Support for treesitter
  use('nvim-treesitter/nvim-treesitter')

  -- Comment stuff out
  use('tpope/vim-commentary')

  -- Package manager
  use('wbthomason/packer.nvim')

  -- Pair completion
  use('windwp/nvim-autopairs')

  -- Toml syntax
  use('cespare/vim-toml')

  -- Language server protocol
  use('neovim/nvim-lspconfig')

  -- View LSP startup progress
  use('arkav/lualine-lsp-progress')

  -- Treesitter parser for just
  use('IndianBoy42/tree-sitter-just')

  -- GLSL syntax highlighting
  use('tikhomirov/vim-glsl')

  -- Telescope file browser
  use('nvim-telescope/telescope-file-browser.nvim')

  -- Statusline
  use('hoob3rt/lualine.nvim')

  -- Tabline
  use('romgrk/barbar.nvim')

  -- Icons for status and tabline
  use('kyazdani42/nvim-web-devicons')

  -- Autocompletion plugin
  use('hrsh7th/nvim-cmp')

  -- Snippets source for nvim-cmp
  use('saadparwaiz1/cmp_luasnip')

  -- LSP source for nvim-cmp
  use('hrsh7th/cmp-nvim-lsp')

  -- Cool vscode-like pictograms
  use('onsails/lspkind.nvim')

  -- General-purpose motion plugin
  use('ggandor/leap.nvim')

  -- Just syntax highlighting
  use({
    "NoahTheDuke/vim-just",
    ft = { "just" },
  })

  -- Github copilot
  use({
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'bottom',
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<Tab>',
            accept_word = false,
            accept_line = false,
            next = '<C-n>',
            prev = '<C-p>',
            dismiss = '<C-]>',
          },
        },
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

  -- A lua-based snippet engine
  use({
    'L3MON4D3/LuaSnip',
    tag = 'v<CurrentMajor>.*',
  })

  -- Use FZF for telescope fuzzy file finding algorithm
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  })

  -- A better latex editing experience
  use({
    'lervag/vimtex',
    ft = 'tex',
  })

  -- Preview markdown files in the browser
  use({
    'euclio/vim-markdown-composer',
    cmd = 'ComposerStart',
    ft = 'markdown',
    run = 'cargo build --release --locked',
  })

  -- Text filtering and alignment
  use({
    'godlygeek/tabular',
    cmd = 'Tabularize',
  })

  -- Markdown syntax support
  use({
    'plasticboy/vim-markdown',
    ft = 'markdown',
  })

  -- Fuzzy file finder
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    },
  })

  -- Treesitter playground
  use({
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
  })

  -- Rust support
  use({
    'rust-lang/rust.vim',
    ft = 'rust',
  })

  -- Query ChatGPT
  use({
    'terror/chatgpt.nvim',
    run = 'pip3 install -r requirements.txt',
  })
end)
