-- 文件树
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    },
    keys = {{"<leader>t", ":NvimTreeToggle<CR>"}}
}
