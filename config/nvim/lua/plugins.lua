local execute      = vim.api.nvim_command
local fn           = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local use = require('packer').use

return require('packer').startup(
  function()
    use { 'airblade/vim-rooter' }
    use { 'editorconfig/editorconfig-vim' }
    use { 'godlygeek/tabular' }
    use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use { 'junegunn/vim-easy-align' }
    use { 'mhinz/vim-startify' }
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} } }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'nvim-treesitter/playground' }
    use { 'rust-lang/rust.vim' }
    use { 'tpope/vim-commentary' }
    use { 'wbthomason/packer.nvim' }
    use { 'windwp/nvim-autopairs' }
  end
)
