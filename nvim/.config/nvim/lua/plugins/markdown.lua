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
    --    {
    --        "3rd/image.nvim",
    --        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    --        opts = {
    --            processor = "magick_cli",
    --        }
    --    }
    --
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
}
