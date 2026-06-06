-- 工具包管理
vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
})

local ok, mason = pcall(require, "mason")
if not ok then
    return
end

mason.setup()
