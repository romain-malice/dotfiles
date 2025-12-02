return {
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {
            dependencies_bin = { ['tinymist'] = 'tinymist' }
        }, -- lazy.nvim will implicitly calls `setup {}`
        config = function()
            vim.keymap.set("n", "<localleader>tt", ":TypstPreviewToggle<CR>")
        end
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
            -- vim.g.vimtex_view_forward_search_on_start = false
        end,
        config = function()
            vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>")
        end
    }
}
