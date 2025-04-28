-- 主题
return {
    "folke/tokyonight.nvim",
    opts = {},
    config = function(_, opts)
        require("tokyonight").setup(opt)
        vim.cmd("colorscheme tokyonight")
    end
}
