require('util')

local home = vim.env.HOME
local config = home .. '/.config/nvim'
local cmd = vim.cmd

cmd('colorscheme base16-seti')
cmd('syntax on')

opt('g', 'mapleader', ' ')
opt('g', 'maplocalleader', ' ')
opt('o', 'autochdir', true)
opt('o', 'autoindent', true)
opt('o', 'autoread', true)
opt('o', 'background', 'dark')
opt('o', 'backspace', 'indent,eol,start')
opt('o', 'backup', false)
opt('o', 'backupcopy', 'yes')
opt('o', 'backupdir', config .. '/backup//')
opt('o', 'belloff', 'all')
opt('o', 'clipboard', 'unnamed')
opt('o', 'conceallevel', 2)
opt('o', 'directory', config .. '/swap//')
opt('o', 'expandtab', true)
opt('o', 'foldenable', false)
opt('o', 'foldmethod', 'marker')
opt('o', 'hidden', true)
opt('o', 'hlsearch', true)
opt('o', 'ignorecase', true)
opt('o', 'incsearch', true)
opt('o', 'linebreak', true)
opt('o', 'mouse', 'a')
opt('o', 'number', false)
opt('o', 'numberwidth', 1)
opt('o', 'ruler', true)
opt('o', 'shiftwidth', 2)
opt('o', 'shiftwidth', 2)
opt('o', 'showcmd', true)
opt('o', 'smartcase', true)
opt('o', 'smartindent', true)
opt('o', 'spellfile', config .. '/spell/en.utf-8.add')
opt('o', 'spelllang', 'en')
opt('o', 'splitbelow', true)
opt('o', 'tabpagemax', 30)
opt('o', 'tabstop', 2)
opt('o', 'termguicolors', true)
opt('o', 'textwidth', 120)
opt('o', 'title', true)
opt('o', 'ttyfast', true)
opt('o', 'undodir', config .. '/undo//')
opt('o', 'undofile', true)
opt('o', 'visualbell', true)
opt('o', 'wildignore', '.pyc,.swp')
opt('o', 'wrap', true)