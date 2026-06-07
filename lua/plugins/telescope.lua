-- 全局搜索
-- requirements:
-- -- fd
-- -- ripgrep
-- -- cmake
vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    -- "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

telescope.setup({
    defaults = {
        layout_strategy = "flex",

        layout_config = {
            flex = {
                flip_columns = 120, -- 小于120列自动切换
            },

            horizontal = {
                preview_width = 0.55,
            },

            vertical = {
                preview_height = 0.5,
            },
        },
    },
})
-- require("telescope").setup({
--     extensions = {
--         fzf = {
--             fuzzy = true,
--             override_generic_sorter = true,
--             override_file_sorter = true,
--             case_mode = "smart_case",
--         },
--     },
-- })
-- pcall(telescope.load_extension, "fzf")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>f', builtin.find_files, { desc = 'Telescope 查找文件' })
vim.keymap.set('n', '<leader><leader>g', builtin.live_grep, { desc = 'Telescope 查找内容' })
vim.keymap.set('n', '<leader><leader>b', builtin.buffers, { desc = 'Telescope 标签页' })
vim.keymap.set('n', '<leader><leader>h', builtin.help_tags, { desc = 'Telescope 帮助文档' })
vim.keymap.set("n", "<leader><leader>i", builtin.lsp_incoming_calls, { desc = "Telescope 查看谁调用了当前函数" })
vim.keymap.set("n", "<leader><leader>d", builtin.diagnostics, { desc = "Telescope 诊断信息", })
