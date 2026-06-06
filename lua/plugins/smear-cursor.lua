-- 光标涂抹
vim.pack.add({
    "https://github.com/sphamba/smear-cursor.nvim"
})

local ok, smear_cursor = pcall(require, "smear_cursor")
if not ok then
    return
end

smear_cursor.setup()
