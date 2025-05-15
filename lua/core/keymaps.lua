-- -- 改键
-- 主键
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- 行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 终端
keymap.set("t", "<ESC>", "<C-\\><C-n>", {
    noremap = true,
    silent = true
})

-- 代码格式化
keymap.set("n", "<leader>f", "<CMD>lua vim.lsp.buf.format()<CR>")

-- 取消高亮
keymap.set("n", "<leader>nh", "<CMD>nohl<CR>")

-- 重做
keymap.set("n", "<leader>r", "<C-r>")
keymap.set("i", "jk", "<ESC>")
