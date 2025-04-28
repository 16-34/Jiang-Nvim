-- -- 改键

-- 主键
vim.g.mapleader = " "

local keymap = vim.keymap

-- 行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")
