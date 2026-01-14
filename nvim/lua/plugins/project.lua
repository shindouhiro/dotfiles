return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
    vim.keymap.set("n", "<C-r>", "<cmd>Telescope projects<cr>", { silent = true, desc = "find project!" })
  end,
}
