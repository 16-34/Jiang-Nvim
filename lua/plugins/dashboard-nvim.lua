-- 封面
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
            },
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
