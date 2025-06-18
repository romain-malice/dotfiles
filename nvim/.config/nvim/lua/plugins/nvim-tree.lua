local builtin = require('nvim-tree')
builtin.setup({
    filters = {
        dotfiles = false,
    },
})
vim.keymap.set('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>')
