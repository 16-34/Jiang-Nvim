-- 屏幕按键
return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "main", to use the latest commit
    opts = {
        win_opts = {
            width = 30,
            height = 1
        },
        clear_after = 2.5
    },
    config = function(_, opts)
        screenkey = require("screenkey")
        screenkey.setup(opts)
        screenkey.toggle()
    end
}
