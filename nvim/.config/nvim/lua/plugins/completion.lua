local cmp = require('cmp')
local ls = require('luasnip')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup{
    sources = {
        { name = 'async_path' },
        { name = 'luasnip' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-K>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if ls.expandable() then
                    ls.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else 
                fallback()
            end
        end),
        ["<C-H>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ["<C-J>"] = cmp.mapping(function(fallback)
            if ls.locally_jumpable(1) then
                ls.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ["<C-E"] = cmp.mapping(function(fallback)
            if ls.choice_active() then
                ls.change_choice(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
}
