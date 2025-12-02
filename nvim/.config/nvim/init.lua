if vim.g.vscode then
else
    require("config.lazy")
    require("config.keymaps")
    require("config.options")
end
