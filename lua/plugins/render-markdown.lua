-- markdown 渲染
return {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = "VeryLazy",
    ft = "markdown",
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'}, -- if you prefer nvim-web-devicons
    opts = {}
}
