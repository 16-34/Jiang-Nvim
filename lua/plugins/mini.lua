-- mini
vim.pack.add({
    -- "https://github.com/echasnovski/mini.nvim",
    "https://github.com/nvim-mini/mini.move",
    "https://github.com/nvim-mini/mini.pairs",
})

local move_ok, mini_move = pcall(require, "mini.move")
if move_ok then
    mini_move.setup()
end

local pairs_ok, mini_pairs = pcall(require, "mini.pairs")
if pairs_ok then
    mini_pairs.setup()
end
