-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    -- merge options,conflict use value from rightmost map
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end
local opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "t" }, "<c-t>", "<cmd>Lspsaga term_toggle<CR>", opts) -- Floating terminal
Map("n", "<leader>dd", ":%delete _<CR>")
Map("i", "jk", "<Esc>")
Map("v", "jk", "<Esc>")
-- Map("n", "<C-h>", "<cmd>lua require'tmux'.move_left()<cr>", { desc = "Go to left window" })
-- Map("n", "<C-j>", "<cmd>lua require'tmux'.move_bottom()<cr>", { desc = "Go to lower window" })
-- Map("n", "<C-k>", "<cmd>lua require'tmux'.move_top()<cr>", { desc = "Go to upper window" })
-- Map("n", "<C-l>", "<cmd>lua require'tmux'.move_right()<cr>", { desc = "Go to right window" })
--
Map("n", "gf", "<cmd>Lspsaga finder<CR>")
Map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
-- ---------- 视觉模式 --------------
Map("v", "<s-h>", "^")
Map("v", "<s-l>", "$")
Map("n", "<s-h>", "^")
Map("n", "<s-l>", "$")
Map("n", "<C-s>", ":w<CR>")
--split
Map("n", "ss", "<C-w>s", { desc = "Go to left window", remap = true })
Map("n", "so", "<C-w>o", { desc = "merge window", remap = true })
Map("n", "<Down>", ":resize +2<CR>")
Map("n", "<Right>", ":vertical resize +2<CR>")
Map("n", "<Left>", ":vertical resize -2<CR>")
Map("n", "<Up>", ":resize -2<CR>")
-- vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
end

-- Map(
--   "n",
--   "<c-t>",
--   "<cmd>Lspsaga term_toggle<cr>",
--   { desc = "Terminal (Root Dir)", noremap = true, silent = true, buffer = bufnr }
-- )
-- Map(
--   "t",
--   "<C-t>",
--   "<cmd>Lspsaga term_toggle<cr>",
--   { desc = "Hide Terminal", noremap = true, silent = true, buffer = bufnr }
-- )
--
-- lazygit
Map("n", "<C-g>", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
Map("n", "<C-b>", ":Telescope buffers<Cr>")
Map("n", "<C-f>", ":Telescope live_grep<Cr>")
-- Map("n", "<C-h>", ":Telescope oldfiles<Cr>")
------------- 插件快捷键-------------
-- vim.keymap.set("n", "lg", "<cmd>Logsitter<cr>"iiii)
-- local opts = { noremap = true, silent = true }

-- 设置快捷键打开浮动终端并输入 ls 命令
-- 打开浮动终端并执行 ls 命令
-- vim.keymap.set("n", "<C-l>", function()
--   vim.cmd("term")
--   vim.api.nvim_put({ "Yazi" }, "b", false, true) -- 发送 ls 命令到终端
--   vim.cmd("startinsert") -- 进入插入模式
-- end, opts)
