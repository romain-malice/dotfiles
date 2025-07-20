return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono"
        },

        completion = { documentation = { auto_show = true } },

        sources = {
            -- Source -> fuzzy matching algorithm -> completion window
            -- `buffer`: gets all words from the buffer (useful for writing)
            default = { "lsp", "path", "snippets", "buffer" },
        },

        -- Way faster than the lua searching algorithm
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" }
}
