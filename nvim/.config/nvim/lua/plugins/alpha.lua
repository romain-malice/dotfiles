local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = {
    [[            ^^                   @@@@@@@@@                               ]],
    [[       ^^       ^^            @@@@@@@@@@@@@@@                            ]],
    [[                            @@@@@@@@@@@@@@@@@@              ^^           ]],
    [[                           @@@@@@@@@@@@@@@@@@@@                          ]],
    [[ ~~~~ ~~ ~~~~~ ~~~~~~~~ ~~ &&&&&&&&&&&&&&&&&&&& ~~~~~~~ ~~~~~~~~~~~ ~~~  ]],
    [[ ~         ~~   ~  ~       ~~~~~~~~~~~~~~~~~~~~ ~       ~~     ~~ ~      ]],
    [[   ~      ~~      ~~ ~~ ~~  ~~~~~~~~~~~~~ ~~~~  ~     ~~~    ~ ~~~  ~ ~~ ]],
    [[   ~  ~~     ~         ~      ~~~~~~  ~~ ~~~       ~~ ~ ~~  ~~ ~         ]],
    [[ ~  ~       ~ ~      ~           ~~ ~~~~~~  ~      ~~  ~             ~~  ]],
    [[       ~             ~        ~      ~      ~~   ~             ~         ]],
}

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<Cmd>ene<CR>"),
    dashboard.button("f", "  Find file", "<Cmd>Telescope find_files <CR>"),
    dashboard.button("r", "  Open recent file", "<Cmd>Telescope oldfiles <CR>"),
    dashboard.button("g", "  Grep text", "<Cmd>Telescope live_grep <CR>"),
    dashboard.button("c", "  Configure", ":e ~/.config/nvim/init.lua<CR>"),
    dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
}

local function footer()
    return "Welcome back !"
end
dashboard.section.footer.val = footer()

-- dashboard.section.footer.opts.hl = "Type"
--dashboard.section.header.opts.hl = "Include"
-- dashboard.section.buttons.opts.hl = "Keyword"

require'alpha'.setup(require'alpha.themes.dashboard'.config)
