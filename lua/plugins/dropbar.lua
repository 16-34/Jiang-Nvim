-- 面包屑导航栏
vim.pack.add({
    "https://github.com/Bekaboo/dropbar.nvim"
})

local ok, dropbar = pcall(require, "dropbar")
if not ok then
    return
end

dropbar.setup()
