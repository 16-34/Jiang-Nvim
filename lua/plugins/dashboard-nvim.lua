return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = {
        -- theme = "doom",
        shortcut_type = "number",
        config = {
            week_header = {
                enable = true, -- boolean use a week header
                append = {"Hello, Lue Jiang!"} -- table append after time string line
            },
            shortcut = { -- action can be a function type
            {
                desc = 'LeetCode',
                key = 'L',
                action = function()
                    if vim.fn.exists(':Leet') == 2 then
                        vim.cmd('Leet')
                    else
                        vim.notify("LeetCode 未安装或命令不存在", vim.log.levels.WARN)
                    end
                end
            }},
            project = {
                enable = false
            },
            mru = {
                enable = true,
                limit = 5,
                cwd_only = false
            },
            footer = {}
        }
    },
    config = function(_, opts)
        require('dashboard').setup(opts)
    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}}
}
