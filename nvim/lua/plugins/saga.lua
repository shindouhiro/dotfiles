return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      finder = {
        keys = {
          vsplit = "v",
          split = "s",
          tabnew = "r",
          shuttle = "<tab>",
        },
      },
      definition = {
        keys = {
          edit = "<C-c>o",
          vsplit = "<C-c>v",
          split = "<C-c>i",
        },
      },
      lightbulb = {
        enable = false,
      },
      implement = {
        enable = true,
      },
    })
  end,
  opts = function()
    local keymap = vim.keymap.set
    keymap("n", "gw", "<cmd>Lspsaga peek_definition<CR>")
    -- keymap("n", "gf", "<cmd>Lspsaga finder<CR>")
    keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
    keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
