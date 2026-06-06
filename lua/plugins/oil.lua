-- 文件管理
vim.pack.add({
    "https://github.com/stevearc/oil.nvim"
})

local ok, oil = pcall(require, "oil")
if not ok then
    return
end

oil.setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
        vim.keymap.set("n", "q", "<cmd>bd<cr>", {
            buffer = true,
            silent = true,
        })
    end,
})
