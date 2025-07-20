local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = " "
vim.g.localleader = "\\"

-- Move around windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window creation
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts)
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Keep visual selection for indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<leader>ct", "<Cmd>colorscheme dayfox<CR>", opts)
-- Notes
-- vim.keymap.set('n', '<leader>pm', ':MarkdownPreviewToggle<CR>', opts)

-- vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename())
