----------------------------
-- Prepare plugin manager --
----------------------------

-- Auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
files()    	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- For nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

---------------------
-- Install plugins --
---------------------

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Prettify
Plug("navarasu/onedark.nvim")           -- Theme
Plug('goolord/alpha-nvim') -- Greeter menu

-- Synthax
Plug('nvim-lua/plenary.nvim')           -- Dependecy for treesitter
Plug('nvim-treesitter/nvim-treesitter') -- Highlighting

-- Files and structure
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' }) -- Grep utility
Plug('nvim-tree/nvim-web-devicons') -- Tabs
Plug('nvim-tree/nvim-tree.lua')

Plug('akinsho/bufferline.nvim')

-- Markdown
Plug('MeanderingProgrammer/render-markdown.nvim') -- Render markdown in the terminal
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })
Plug('tadmccorkle/markdown.nvim') -- Markdown features

-- Typst & Latex
Plug('chomosuke/typst-preview.nvim', { ['tag'] = 'v1.*'})

-- Write faster
Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'}) -- Snippets
Plug('hrsh7th/nvim-cmp')
Plug('saadparwaiz1/cmp_luasnip')
Plug('FelipeLema/cmp-async-path')
Plug('rafamadriz/friendly-snippets')

-- Show colors
Plug('norcalli/nvim-colorizer.lua')

vim.call('plug#end')

-------------
-- Options --
-------------

-- Nvim
require("config.options")
require("config.keymaps")

-- Plugins
require("plugins.theme")        -- Theme (current: OneDark)
require("plugins.telescope")
require("plugins.alpha")
require("plugins.markdown")
require("plugins.completion")
require("plugins.treesitter")
require("plugins.typst")
require("plugins.colorizer")
require("plugins.bufferline")
require("plugins.nvim-tree")
