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
  -- Justfile syntax highlighting
  use('NoahTheDuke/vim-just')

  --  Changes Vim working directory to project root
  use('airblade/vim-rooter')

  --  Check syntax asynchronously
  use('dense-analysis/ale')

  -- Support .editorconfig
  use('editorconfig/editorconfig-vim')

  -- A vim alignment plugin
  use('junegunn/vim-easy-align')

  -- Cool start screen
  use('mhinz/vim-startify')

  -- Support for treesitter
  use('nvim-treesitter/nvim-treesitter')

  -- Tabline
  use('romgrk/barbar.nvim')

  -- Comment stuff out
  use('tpope/vim-commentary')

  -- Package manager
  use('wbthomason/packer.nvim')

  -- Pair completing
  use('windwp/nvim-autopairs')

  -- Toml syntax
  use('cespare/vim-toml')

  -- Language server protocol
  use('neovim/nvim-lspconfig')

  -- Snippets
  use('SirVer/ultisnips')

  -- View LSP startup progress
  use('arkav/lualine-lsp-progress')

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

  -- Statusline
  use({
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
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
end)
