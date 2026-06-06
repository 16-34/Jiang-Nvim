-- 快捷键速查
vim.pack.add({
    "https://github.com/folke/which-key.nvim",
})

local ok, wk = pcall(require, "which-key")
if not ok then
    return
end

wk.setup()

vim.keymap.set("n", "?", function()
    wk.show()
end, { desc = "which-key 键盘映射图" })
