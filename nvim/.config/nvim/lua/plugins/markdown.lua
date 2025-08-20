return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",

        init = function()
            -- Define the Vim function in Lua using vim.api.nvim_exec
            vim.api.nvim_exec([[
            function! OpenMarkdownPreview(url)
                " Launch the preview in the browser with a new window
                silent! execute 'silent !librewolf --new-window ' . a:url
            endfunction
        ]], false)

            -- Set up the markdown-preview.nvim plugin options
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'  -- Set the function name
            vim.g.mkdp_theme = 'custom'
            vim.g.mkdp_markdown_css = '~/.config/nvim/lua/plugins/mdpreview.css'
        end,

        ft = { "markdown" },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter'},
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            completions = { lsp = { enabled = true } },
            render_modes = true,
        },
    },
    {
        'kiran94/edit-markdown-table.nvim',
        config = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "EditMarkdownTable",
    }
}
