return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable("lua-language-server")
        end,
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
}
