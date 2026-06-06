-- 文件树
vim.pack.add({
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3')
    },
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    -- optional, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",
})

local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
    return
end

neo_tree.setup({
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                require("neo-tree.command").execute({
                    action = "close",
                })
            end,
        },
    },
})

vim.keymap.set('n', '<leader>t', "<CMD>Neotree toggle<CR>", { desc = "Neotree 展开/折叠文件树" })
