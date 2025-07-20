return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = 'false',
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "vim", "vimdoc", "query", "lua", "c", "latex", "typst",  "python" }, -- The 5 first are there for general neovim purpose
                auto_install = true,
                highlight = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>ss",
                        node_incremental = "<leader>si",
                        scope_incremental = "<leader>sc", -- Scope = place where a variable can live in (e.g. file, function, ..)
                        node_decremental = "<leader>sd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- Decides the mode for each object
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V', -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
}
