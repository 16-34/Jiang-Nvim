-- mini
vim.pack.add({
    -- "https://github.com/echasnovski/mini.nvim",
    "https://github.com/nvim-mini/mini.move",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/nvim-mini/mini.pairs",
})

local move_ok, mini_move = pcall(require, "mini.move")
if move_ok then
    mini_move.setup()
end

local pick_ok, mini_pick = pcall(require, "mini.pick")
if pick_ok then
    mini_pick.setup()
    vim.keymap.set('n', '<leader><leader>f', "<CMD>Pick files<CR>", { desc = 'mini.pick 查找文件' })
    vim.keymap.set('n', '<leader><leader>g', "<CMD>Pick live_grep<CR>", { desc = 'mini.pick 查找内容' })
    vim.keymap.set('n', '<leader><leader>b', "<CMD>Pick buffers<CR>", { desc = 'mini.pick 标签页' })
    vim.keymap.set('n', '<leader><leader>h', "<CMD>Pick help<CR>", { desc = 'mini.pick 帮助文档' })
end

local pairs_ok, mini_pairs = pcall(require, "mini.pairs")
if pairs_ok then
    mini_pairs.setup()
end
-- require("mini.statusline").setup()
