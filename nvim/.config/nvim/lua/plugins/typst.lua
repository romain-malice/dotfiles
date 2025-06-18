require'typst-preview'.setup{}

vim.keymap.set('n', '<leader>pt', "<Cmd>TypstPreviewToggle<CR>", { desc = "Toggle typst preview" })
