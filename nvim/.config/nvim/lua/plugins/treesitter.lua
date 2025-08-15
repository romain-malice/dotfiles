return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "OXY2DEV/markview.nvim"
    },
    config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "python", "latex", "typst", "markdown", "markdown_inline", "html", "yaml" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end,
}
