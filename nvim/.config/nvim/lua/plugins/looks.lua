return {
    {
        'nvim-mini/mini.statusline',
        version = false,
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    }
}
