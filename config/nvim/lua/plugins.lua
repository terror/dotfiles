local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

local use = require("packer").use

return require("packer").startup(function()
  -- justfile syntax highlighting
  use("NoahTheDuke/vim-just")

  --  changes Vim working directory to project root
  use("airblade/vim-rooter")

  --  check syntax asynchronously
  use("dense-analysis/ale")

  -- support .editorconfig
  use("editorconfig/editorconfig-vim")

  -- a vim alignment plugin
  use("junegunn/vim-easy-align")

  -- cool start screen
  use("mhinz/vim-startify")

  -- support for treesitter
  use("nvim-treesitter/nvim-treesitter")

  -- tabline
  use("romgrk/barbar.nvim")

  -- comment stuff out
  use("tpope/vim-commentary")

  -- package manager
  use("wbthomason/packer.nvim")

  -- pair completing
  use("windwp/nvim-autopairs")

  -- toml syntax
  use("cespare/vim-toml")

  -- language server protocol
  use("neovim/nvim-lspconfig")

  -- preview markdown files in the browser
  use({
    "euclio/vim-markdown-composer",
    cmd = "ComposerStart",
    ft = "markdown",
    run = "cargo build --release --locked",
  })

  -- text filtering and alignment
  use({
    "godlygeek/tabular",
    cmd = "Tabularize",
  })

  -- markdown syntax support
  use({
    "plasticboy/vim-markdown",
    ft = "markdown",
  })

  -- statusline
  use({
    "hoob3rt/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
  })

  -- fuzzy file finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  })

  -- treesitter playground
  use({
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  })

  -- rust support
  use({
    "rust-lang/rust.vim",
    ft = "rust",
  })
end)
