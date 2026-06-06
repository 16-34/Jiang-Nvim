-- AST
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter"
})

local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
    return
end

treesitter.setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
        "markdown",
        "markdown_inline",
    },
    highlight = {
        enable = true,
    },
})
