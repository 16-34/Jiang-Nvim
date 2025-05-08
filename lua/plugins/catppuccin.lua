-- 主题
return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd("colorscheme catppuccin")
    end
}
