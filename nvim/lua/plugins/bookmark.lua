return {
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "crusj/bookmarks.nvim",
    keys = {
      { "bm", mode = { "n" } },
      { "mi", mode = { "n" } },
      { "mg", mode = { "n" } },
      { "mx", mode = { "n" } },
      { "<c-j>", mode = { "n" } },
      { "<c-k>", mode = { "n" } },
    },
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    config = function()
      require("bookmarks").setup({
        keymap = {
          toggle = "bm", -- Toggle bookmarks(global keymap)
          close = "q", -- close bookmarks (buf keymap)
          add = "mi", -- Add bookmarks(global keymap)
          add_global = "mg", -- Add global bookmarks(global keymap), global bookmarks will appear in all projects. Identified with the symbol '󰯾'
          jump = "<CR>", -- Jump from bookmarks(buf keymap)
          delete = "dd", -- Delete bookmarks(buf keymap)
          order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
          delete_on_virt = "mx", -- Delete bookmark at virt text line(global keymap)
          show_desc = "\\sd", -- show bookmark desc(global keymap)
          focus_tags = "<c-j>", -- focus tags window
          focus_bookmarks = "<c-k>", -- focus bookmarks window
          toogle_focus = "<S-Tab>", -- toggle window focus (tags-window <-> bookmarks-window)
        },
      })
      require("telescope").load_extension("bookmarks")
    end,
  },
}
