return {
    "lervag/vimtex",
    lazy = false,     -- Already loads only when a .tex buffer is opened
    init = function()
        vim.g.vimtex_view_method = "zathura"
    end
}
