-- 文件树
vim.pack.add({
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
    return
end

nvim_tree.setup({
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
})

vim.keymap.set('n', '<leader>t', "<CMD>NvimTreeToggle<CR>", { desc = "NvimTree 展开/折叠文件树" })
