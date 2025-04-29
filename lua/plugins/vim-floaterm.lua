-- 浮动终端
return {
    "voldikss/vim-floaterm",
    keys = function()
        local keymap = {}
        local os_name = vim.loop.os_uname().sysname

        if os_name == "Darwin" then
            table.insert(keymap, {
                "<C-`>",
                "<CMD>FloatermToggle<CR>",
                mode = {"n", "t"}
            })
        else
            table.insert(keymap, {
                "<A-`>",
                "<CMD>FloatermToggle<CR>",
                mode = {"n", "t"}
            })
        end

        return keymap
    end,
    config = function()
        vim.g.floaterm_autoclose = 2
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
    end
}
