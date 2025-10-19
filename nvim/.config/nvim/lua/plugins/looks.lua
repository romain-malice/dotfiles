return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {} },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "moon",
        }
    }
}
