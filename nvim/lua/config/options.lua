-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt
opt.conceallevel = 0 -- 不隐藏任何文本内容，所有语法符号都原样显示。
opt.wrap = false -- 不自动换行
opt.swapfile = false -- 不创建 .swp 文件
opt.backup = false -- 不生成备份文件
opt.undofile = true -- 启用撤销文件（建议开着，用来恢复操作历史）
opt.scrolloff = 5 -- 上下预留行距
