return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "markdown", "markdown_inline", "latex", "python", "c" },
            highlight = { enable = true },
        })
        vim.g.markdown_folding = 1
        vim.g.mardown_recommend_style = 0
    end
}
