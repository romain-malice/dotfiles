return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable("clangd")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("tinymist")
            vim.lsp.enable("bash_language_server")
        end,
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
}
