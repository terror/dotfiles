-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
  vim.api.nvim_command(
    'echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"'
  )
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b)
      return a[2] > b[2]
    end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
      end
    end

    _G._packer = _G._packer or {}
    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
    '/Users/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua'
  local install_cpath_pattern =
    '/Users/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so'
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify(
          'packer.nvim: Error running '
            .. component
            .. ' for '
            .. name
            .. ': '
            .. result,
          vim.log.levels.ERROR,
          {}
        )
      end)
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ale = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/ale',
      url = 'https://github.com/dense-analysis/ale',
    },
    ['barbar.nvim'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/barbar.nvim',
      url = 'https://github.com/romgrk/barbar.nvim',
    },
    ['editorconfig-vim'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/editorconfig-vim',
      url = 'https://github.com/editorconfig/editorconfig-vim',
    },
    ['lualine.nvim'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/lualine.nvim',
      url = 'https://github.com/hoob3rt/lualine.nvim',
    },
    ['nvim-autopairs'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-autopairs',
      url = 'https://github.com/windwp/nvim-autopairs',
    },
    ['nvim-lspconfig'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-lspconfig',
      url = 'https://github.com/neovim/nvim-lspconfig',
    },
    ['nvim-treesitter'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-treesitter',
      url = 'https://github.com/nvim-treesitter/nvim-treesitter',
    },
    ['nvim-web-devicons'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-web-devicons',
      url = 'https://github.com/kyazdani42/nvim-web-devicons',
    },
    ['packer.nvim'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/packer.nvim',
      url = 'https://github.com/wbthomason/packer.nvim',
    },
    playground = {
      commands = { 'TSPlaygroundToggle' },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/opt/playground',
      url = 'https://github.com/nvim-treesitter/playground',
    },
    ['plenary.nvim'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/plenary.nvim',
      url = 'https://github.com/nvim-lua/plenary.nvim',
    },
    ['popup.nvim'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/popup.nvim',
      url = 'https://github.com/nvim-lua/popup.nvim',
    },
    ['rust.vim'] = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim',
      url = 'https://github.com/rust-lang/rust.vim',
    },
    tabular = {
      after_files = {
        '/Users/liam/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim',
      },
      commands = { 'Tabularize' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/opt/tabular',
      url = 'https://github.com/godlygeek/tabular',
    },
    ['telescope.nvim'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/telescope.nvim',
      url = 'https://github.com/nvim-telescope/telescope.nvim',
    },
    ['vim-commentary'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/vim-commentary',
      url = 'https://github.com/tpope/vim-commentary',
    },
    ['vim-easy-align'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/vim-easy-align',
      url = 'https://github.com/junegunn/vim-easy-align',
    },
    ['vim-just'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/vim-just',
      url = 'https://github.com/NoahTheDuke/vim-just',
    },
    ['vim-markdown'] = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown',
      url = 'https://github.com/plasticboy/vim-markdown',
    },
    ['vim-markdown-composer'] = {
      commands = { 'ComposerStart' },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown-composer',
      url = 'https://github.com/euclio/vim-markdown-composer',
    },
    ['vim-rooter'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/vim-rooter',
      url = 'https://github.com/airblade/vim-rooter',
    },
    ['vim-startify'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/vim-startify',
      url = 'https://github.com/mhinz/vim-startify',
    },
    ['vim-toml'] = {
      loaded = true,
      path = '/Users/liam/.local/share/nvim/site/pack/packer/start/vim-toml',
      url = 'https://github.com/cespare/vim-toml',
    },
  }

  time([[Defining packer_plugins]], false)

  -- Command lazy-loads
  time([[Defining lazy-load commands]], true)
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file ComposerStart lua require("packer.load")({'vim-markdown-composer'}, { cmd = "ComposerStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load commands]], false)

  vim.cmd([[augroup packer_load_aucmds]])
  vim.cmd([[au!]])
  -- Filetype lazy-loads
  time([[Defining lazy-load filetype autocommands]], true)
  vim.cmd(
    [[au FileType markdown ++once lua require("packer.load")({'vim-markdown', 'vim-markdown-composer'}, { ft = "markdown" }, _G.packer_plugins)]]
  )
  vim.cmd(
    [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load filetype autocommands]], false)
  vim.cmd('augroup END')
  vim.cmd([[augroup filetypedetect]])
  time(
    [[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]],
    true
  )
  vim.cmd(
    [[source /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
  )
  time(
    [[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]],
    false
  )
  time(
    [[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]],
    true
  )
  vim.cmd(
    [[source /Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
  )
  time(
    [[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]],
    false
  )
  vim.cmd('augroup END')
  if should_profile then
    save_profiles()
  end
end)

if not no_errors then
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: '
      .. error_msg
      .. '" | echom "Please check your config for correctness" | echohl None'
  )
end
