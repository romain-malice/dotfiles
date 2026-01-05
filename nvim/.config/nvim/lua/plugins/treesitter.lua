-- This plugin help with installation of treesitter parsers for different
-- languages
return {
    -- This command alone adds the `:TS...` commands which can be used to
    -- install language parsers
    "nvim-treesitter/nvim-treesitter",
    -- Once a language parser is installed, it can produce a tree (:e to
    -- reload) of the file (:InspectTree).

    -- The first application of the abstract tree is to get better
    -- highlighting. This is possible because treesitter turns the code text
    -- into abstract concepts like (repeater, declaration, ...).

    config = function()
        -- Installing languages
        require("nvim-treesitter").install({ "lua" })

        -- Enabling treesitter for these filetypes
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*.lua" },
            callback = function() vim.treesitter.start() end,
        })
    end,
}
