return {
    {
        'saghen/blink.cmp',
        dependencies = { { 'rafamadriz/friendly-snippets' }, { 'L3MON4D3/LuaSnip', version = 'v2.*' } },
        version = '1.*',
        opts = {
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            keymap = {
                preset = 'default',
                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<C-j>'] = { 'select_next', 'fallback' },
            },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            snippets = { preset = 'luasnip' },
        },
        opts_extend = { "sources.default" }
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            -- Basic options
            require("luasnip").config.set_config({ -- Setting LuaSnip config
                enable_autosnippets = true,
                store_selection_keys = "<Tab>",
                update_events = 'TextChanged,TextChangedI',
            })

            -- Set keymaps
            local ls = require("luasnip")
            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })

            -- Snippets path
            require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/luasnippets/" } })
        end
    },
}
