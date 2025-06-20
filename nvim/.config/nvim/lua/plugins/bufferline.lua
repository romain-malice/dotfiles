vim.opt.termguicolors = true
require("bufferline").setup{}

vim.keymap.set('n', '<leader>1', "<Cmd>BufferLineGoToBuffer 1<CR>")
vim.keymap.set('n', '<leader>2', "<Cmd>BufferLineGoToBuffer 2<CR>")
vim.keymap.set('n', '<leader>3', "<Cmd>BufferLineGoToBuffer 3<CR>")
vim.keymap.set('n', '<leader>4', "<Cmd>BufferLineGoToBuffer 4<CR>")
vim.keymap.set('n', '<leader>5', "<Cmd>BufferLineGoToBuffer 5<CR>")

vim.keymap.set('n', '<leader>[', "<Cmd>BufferLineCyclePrev<CR>")
vim.keymap.set('n', '<leader>]', "<Cmd>BufferLineCycleNext<CR>")

vim.keymap.set('n', '<leader>q', "<Cmd>bd<CR>")
