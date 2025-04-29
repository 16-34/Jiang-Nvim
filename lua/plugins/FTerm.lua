-- 悬浮终端
return {
    "numToStr/FTerm.nvim",
    opt = {
        border = 'double',
        dimensions = {
            height = 0.9,
            width = 0.9
        }
    },
    keys = {{
        "<C-`>",
        "<CMD>lua require('FTerm').toggle()<CR>",
        mode = {"n", "t"}
    }}
}
