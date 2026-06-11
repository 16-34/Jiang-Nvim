-- snacks
vim.pack.add({
    "https://github.com/folke/snacks.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

local ok, snacks = pcall(require, "snacks")
if not ok then
    return
end

snacks.setup({
    notifier = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },

    picker = {
        ui_select = true,
        matcher = { frecency = true, cwd_bonus = true, history_bonus = true },
        formatters = { icon_width = 3 },
        win = {
            input = {
                keys = {
                    ["<C-t>"] = { "edit_tab", mode = { "n", "i" } },
                    ["<Tab>"] = { "confirm", mode = { "n", "i" } },
                },
            },
        },
    },

    dashboard = {
        enabled = true,
        width = 50,
        preset = {
            keys = {
                { icon = "󰈞 ", key = "f", desc = "查找文件", action = ":lua Snacks.picker.smart()" },
                { icon = " ", key = "r", desc = "最近文件", action = ":lua Snacks.picker.recent()" },
                { icon = " ", key = "n", desc = "创建新文件", action = ":enew" },
                { icon = " ", key = "m", desc = "Mason 面板", action = ":Mason" },
                { icon = " ", key = "c", desc = "Nvim 配置", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = " ", key = "q", desc = "离开", action = ":qa" },
            },
            header = [[
  ██╗       ██╗   ██╗   ███████╗
  ██║       ██║   ██║   ██╔════╝
██║       ██║   ██║   █████╗
██║       ██║   ██║   ██╔══╝
  ███████╗  ╚██████╔╝   ███████╗
  ╚══════╝   ╚═════╝    ╚══════╝
]],
        },
        sections = {
            { section = "header" },
            { section = "keys", padding = 1 },
            { pane = 2, icon = " ", title = "最近文件", section = "recent_files", indent = 2, padding = 1 },
            { pane = 2, icon = " ", title = "最近目录", section = "projects", indent = 2, padding = 1 },
            {
                pane = 2,
                icon = " ",
                title = "Git 仓库",
                section = "terminal",
                cmd =
                [[sh -lc 'if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then git status --short --branch --renames; else printf "%s\n" "当前目录不是 git 仓库"; fi']],
                height = 5,
                padding = 1,
                -- ttl = 5 * 60,
                indent = 4,
            },
        },
    },

    terminal = {
        win = {
            width = 0.7,
            height = 0.6,
            position = "float",
            border = "rounded",
        },
    },
    image = {
        enabled = true,
        doc = { enabled = true, inline = false, float = true, max_width = 50, max_height = 50 },
    },
    styles = {
        snacks_image = {
            border = "rounded",
            backdrop = false,
        },
    },
})

vim.keymap.set('n', '<leader><leader>f', snacks.picker.smart, { desc = 'Snacks 查找文件' })
vim.keymap.set('n', '<leader><leader>g', snacks.picker.grep, { desc = 'Snacks 查找内容' })
vim.keymap.set('n', '<leader><leader>b', function()
    snacks.picker.buffers({ sort_lastused = true })
end, { desc = 'Snacks 查找标签页' })
vim.keymap.set('n', '<leader><leader>k', snacks.picker.keymaps, { desc = 'Snacks 查找按键映射' })
vim.keymap.set('n', '<leader><leader>h', snacks.picker.help, { desc = 'Snacks 查找帮助文档' })
vim.keymap.set("n", "<leader><leader>d", snacks.picker.diagnostics_buffer, { desc = "Snacks 查找诊断信息", })
vim.keymap.set("n", "<leader><leader>/", snacks.picker.lines, { desc = "Snacks 在当前文件模糊查找", })

vim.keymap.set("n", "<leader><leader>n", snacks.notifier.show_history, { desc = "Snacks 查看通知历史" })
vim.keymap.set('n', '<leader><leader>i', snacks.picker.lsp_incoming_calls, { desc = 'Snacks 查看谁调用了当前函数' })
vim.keymap.set('n', '<leader><leader>t', snacks.picker.treesitter, { desc = 'Snacks 查找语法树' })
vim.keymap.set('n', '<leader><leader>s', snacks.picker.lsp_symbols, { desc = 'Snacks 查找 lsp 符号' })

vim.keymap.set('n', '<leader>t', snacks.explorer.open, { desc = 'Snacks 文件树' })

vim.keymap.set('n', 'gr', function()
    snacks.picker.lsp_references({ include_current = true })
end, { desc = 'Snacks 查找引用' })

vim.keymap.set({ "n", "t" }, "<C-`>", snacks.terminal.toggle, { desc = "ToggleTerm 切换终端" })

vim.keymap.set("n", "<leader><leader>z", function()
    snacks.zen()
end, { desc = "Snacks 禅模式" }
)
