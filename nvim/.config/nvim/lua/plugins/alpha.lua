return {
    {
        'goolord/alpha-nvim',
        config = function ()
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
                dashboard.button("e", "  New file", "<Cmd>ene<CR>"),
                dashboard.button("f", "  Find file", "<Cmd>Telescope find_files <CR>"),
                dashboard.button("r", "  Open recent file", "<Cmd>Telescope oldfiles <CR>"),
                dashboard.button("g", "  Grep text", "<Cmd>Telescope live_grep <CR>"),
                dashboard.button("c", "  Quick fix",
                    -- Calling a function 
                    function()
                        require('telescope.builtin').find_files{
                            cwd=vim.fn.stdpath('config')
                        }
                    end),
                dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
            }

            local function footer()
                return "Welcome back !"
            end
            dashboard.section.footer.val = footer()

            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    };
}
