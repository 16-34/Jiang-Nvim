-- 浮动终端
return {{
    "voldikss/vim-floaterm",
    keys = {{
        "<A-`>",
        "<CMD>FloatermToggle<CR>",
        mode = {"n", "t"}
    }},
    config = function()
        vim.g.floaterm_autoclose = 2
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
    end
}}
