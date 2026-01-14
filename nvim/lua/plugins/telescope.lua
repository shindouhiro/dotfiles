local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<C-p>",
      "<cmd>Telescope find_files<cr>",
      desc = "Find File",
    },
    { "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Grep (cwd)" },
    -- ban previous keymap
    {
      "<leader>ss",
      false,
    },
    -- fitten code
    {

      "<leader>fc",
      false,
    },
  },
  opts = {
    defaults = {
      mappings = {
        --   ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
        i = {
          ["<c-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<c-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { no_ignore = true, default_text = line })()
          end,
          ["<a-h>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { hidden = true, default_text = line })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["<c-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<c-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
}
