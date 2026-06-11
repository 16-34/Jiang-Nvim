-- 代码大纲
vim.pack.add({
    "https://github.com/hedyhli/outline.nvim"
})

local ok, outline = pcall(require, "outline")
if not ok then
    return
end

outline.setup {
    -- Your setup opts here (leave empty to use defaults)
}

vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Outline 切换大纲" })
