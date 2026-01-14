return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem.root_cwd = nil
    opts.filesystem.follow_current_file.enabled = true
    opts.filesystem.hijack_netrw_behavior = "open_current"
    
    opts.filesystem.window.mappings = opts.filesystem.window.mappings or {}
    opts.filesystem.window.mappings["<leader>p"] = "image_wezterm"
    
    local function image_preview_command(state)
      local node = state.tree:get_node()
      if node.type == "file" then
        require("image_preview").PreviewImage(node.path)
      end
    end

    opts.filesystem.commands = opts.filesystem.commands or {}
    opts.filesystem.commands.image_wezterm = image_preview_command
    
    local function set_root_to_current_file_dir()
      local current_file = vim.fn.expand('%:p:h')
      if current_file and current_file ~= '' then
        return current_file
      end
    end
    
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.bo.filetype == "neo-tree" then
          local dir = set_root_to_current_file_dir()
          if dir then
            vim.cmd('cd ' .. dir)
          end
        end
      end,
    })
    
    return opts
  end,
}
