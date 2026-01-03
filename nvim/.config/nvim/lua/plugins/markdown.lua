return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "jbyuki/nabla.nvim",
        dependencies = {
            "nvim-neo-tree/neo-tree.nvim",
            "williamboman/mason.nvim",
        },
        lazy = true,

        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "latex" },
                auto_install = true,
                sync_install = false,
            })
            require("nabla").enable_virt()
        end,

        keys = function()
            return {
                {
                    "<leader>p",
                    ':lua require("nabla").popup()<cr>',
                    desc = "NablaPopUp",
                },
            }
        end,
    },
    { "jbyuki/venn.nvim" },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = "cd app && npm install",
    }
}
