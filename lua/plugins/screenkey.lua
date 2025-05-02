-- 屏幕按键
return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "main", to use the latest commit
    config = function(_, opt)
        screenkey = require("screenkey")
        screenkey.setup({
            win_opts = {
                row = 1,
                col = vim.o.columns - 1,
                anchor = "NE",
                width = 30,
                height = 1
            },
            clear_after = 2.5
        })
        screenkey.toggle()
    end
}
