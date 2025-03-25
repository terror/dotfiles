-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/liam/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/Users/liam/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/Users/liam/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/Users/liam/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/liam/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
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
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    commands = { "Copilot" },
    config = { "\27LJ\2\nŸ\3\0\0\5\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0005\4\v\0=\4\5\3=\3\f\2B\0\2\1K\0\1\0\15suggestion\1\0\6\fdismiss\n<C-]>\tprev\n<C-p>\16accept_line\1\16accept_word\1\vaccept\n<Tab>\tnext\n<C-n>\1\0\4\rdebounce\3K\17auto_trigger\2\fenabled\2\vkeymap\0\npanel\1\0\2\npanel\0\15suggestion\0\vlayout\1\0\2\nratio\4š³æÌ\t™³æþ\3\rposition\vbottom\vkeymap\1\0\5\14jump_prev\a[[\vaccept\t<CR>\topen\v<M-CR>\frefresh\agr\14jump_next\a]]\1\0\4\vlayout\0\17auto_refresh\2\fenabled\2\vkeymap\0\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parrot.nvim"] = {
    config = { "\27LJ\2\nÖ\2\0\0\b\0\19\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\17\0005\3\b\0005\4\6\0006\5\3\0009\5\4\5'\a\5\0B\5\2\2=\5\a\4=\4\t\0034\4\0\0=\4\n\0035\4\f\0006\5\3\0009\5\4\5'\a\v\0B\5\2\2=\5\a\4=\4\r\0035\4\15\0006\5\3\0009\5\4\5'\a\14\0B\5\2\2=\5\a\4=\4\16\3=\3\18\2B\0\2\1K\0\1\0\14providers\1\0\1\14providers\0\bxai\1\0\1\fapi_key\0\16XAI_API_KEY\vopenai\1\0\1\fapi_key\0\19OPENAI_API_KEY\vollama\14anthropic\1\0\4\14anthropic\0\vollama\0\bxai\0\vopenai\0\fapi_key\1\0\1\fapi_key\0\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\frequire\0" },
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/parrot.nvim",
    url = "https://github.com/frankroeder/parrot.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tiny-code-action.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21tiny-code-action\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/tiny-code-action.nvim",
    url = "https://github.com/rachartier/tiny-code-action.nvim"
  },
  ["typst-preview.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18typst-preview\frequire\0" },
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/typst-preview.nvim",
    url = "https://github.com/chomosuke/typst-preview.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/vim-glsl",
    url = "https://github.com/tikhomirov/vim-glsl"
  },
  ["vim-just"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/vim-just",
    url = "https://github.com/NoahTheDuke/vim-just"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-markdown-composer"] = {
    commands = { "ComposerStart" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown-composer",
    url = "https://github.com/euclio/vim-markdown-composer"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/liam/.local/share/nvim/site/pack/packer/start/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: parrot.nvim
time([[Config for parrot.nvim]], true)
try_loadstring("\27LJ\2\nÖ\2\0\0\b\0\19\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\17\0005\3\b\0005\4\6\0006\5\3\0009\5\4\5'\a\5\0B\5\2\2=\5\a\4=\4\t\0034\4\0\0=\4\n\0035\4\f\0006\5\3\0009\5\4\5'\a\v\0B\5\2\2=\5\a\4=\4\r\0035\4\15\0006\5\3\0009\5\4\5'\a\14\0B\5\2\2=\5\a\4=\4\16\3=\3\18\2B\0\2\1K\0\1\0\14providers\1\0\1\14providers\0\bxai\1\0\1\fapi_key\0\16XAI_API_KEY\vopenai\1\0\1\fapi_key\0\19OPENAI_API_KEY\vollama\14anthropic\1\0\4\14anthropic\0\vollama\0\bxai\0\vopenai\0\fapi_key\1\0\1\fapi_key\0\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\frequire\0", "config", "parrot.nvim")
time([[Config for parrot.nvim]], false)
-- Config for: typst-preview.nvim
time([[Config for typst-preview.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18typst-preview\frequire\0", "config", "typst-preview.nvim")
time([[Config for typst-preview.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'ComposerStart', function(cmdargs)
          require('packer.load')({'vim-markdown-composer'}, { cmd = 'ComposerStart', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-markdown-composer'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ComposerStart ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TSPlaygroundToggle', function(cmdargs)
          require('packer.load')({'playground'}, { cmd = 'TSPlaygroundToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'playground'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSPlaygroundToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType just ++once lua require("packer.load")({'vim-just'}, { ft = "just" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown', 'vim-markdown-composer'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au LspAttach * ++once lua require("packer.load")({'tiny-code-action.nvim'}, { event = "LspAttach *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-just/ftdetect/just.lua]], true)
vim.cmd [[source /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-just/ftdetect/just.lua]]
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-just/ftdetect/just.lua]], false)
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-just/ftdetect/just.vim]], true)
vim.cmd [[source /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-just/ftdetect/just.vim]]
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-just/ftdetect/just.vim]], false)
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/liam/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
