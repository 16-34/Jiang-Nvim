-- AST
return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    event = "VeryLazy",
    opts = {
        ensure_installed = {"c", "cpp", "lua", "python", "html", "markdown", "markdown_inline"},
        highlight = {
            enable = true
        }
    }
}
