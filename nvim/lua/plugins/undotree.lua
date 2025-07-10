return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<F5>", ":UndotreeToggle<CR>", { desc = "Toggle Undotree" })
  end,
}
