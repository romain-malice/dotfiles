return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
      vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>"),
      vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>"),
  }
  ---@diagnostic enable: missing-fields
}
