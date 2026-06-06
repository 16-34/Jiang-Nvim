-- -- 改键
-- 主键
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- 代码格式化
keymap.set("n", "<leader>f", "<CMD>lua vim.lsp.buf.format()<CR>", { desc = "代码格式化" })

-- 取消高亮
keymap.set("n", "<leader>nh", "<CMD>nohl<CR>", { desc = "取消高亮" })

-- 重做
keymap.set("n", "<leader>r", "<C-r>", { desc = "重做" })
keymap.set("i", "jk", "<ESC>")

-- 窗格分割
keymap.set("n", "<leader>|", "<CMD>split<CR>", { desc = "水平分割窗格" })
keymap.set("n", "<leader>\\", "<CMD>vsplit<CR>", { desc = "垂直分割窗格" })

-- 窗格跳转
keymap.set("n", "<leader><Left>", "<C-w>h", { desc = "跳转到左边窗格" })
keymap.set("n", "<leader><Right>", "<C-w>l", { desc = "跳转到右边窗格" })
keymap.set("n", "<leader><Up>", "<C-w>k", { desc = "跳转到上方窗格" })
keymap.set("n", "<leader><Down>", "<C-w>j", { desc = "跳转到下方窗格" })
keymap.set("n", "<leader>w", "<C-w>c", { desc = "关闭当前窗格" })

keymap.set("i", "<C-i>", "<CMD>Inspect<CR>", { desc = "检查" })

-- 光标移动
vim.keymap.set("i", "<M-Left>", "<C-o>b")
vim.keymap.set("i", "<M-Right>", "<C-o>w")
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")

-- 终端
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set({ "n", "t" }, "<C-`>", function()
    local term_buf = nil

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buftype == "terminal" then
            term_buf = buf
            break
        end
    end

    if term_buf then
        local win = vim.fn.bufwinid(term_buf)
        if win ~= -1 then
            vim.api.nvim_win_close(win, true) -- 折叠
        else
            vim.cmd("botright split")
            vim.cmd("buffer " .. term_buf) -- 展开
        end
    else
        vim.cmd("botright split | terminal") -- 首次创建
    end
end, { desc = "切换终端" })
