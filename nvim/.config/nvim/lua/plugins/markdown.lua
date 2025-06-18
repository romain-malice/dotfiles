-- Markdown
require('markdown').setup({
    on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr }
        map({ 'n', 'i' }, '<S-CR>', '<Cmd>MDListItemBelow<CR>', opts)
        map('n', '<leader>mt', '<Cmd>MDTaskToggle<CR>', opts)
    end,
})

-- Markdown preview

vim.g.mkdp_browser = 'librewolf'
