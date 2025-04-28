-- LSP 服务器
return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {"neovim/nvim-lspconfig", "williamboman/mason-lspconfig"},
    opts = {},
    config = function(_, opts)
        require("mason").setup(opts)
        local registry = require("mason-registry")

        local function setup(lsp_name, config)
            local success, package = pcall(registry.get_package, lsp_name)
            if success and not package:is_installed() then
                package:install()
            end

            local nvim_lsp = require("mason-lspconfig.mappings.server").package_to_lspconfig[lsp_name]
            require("lspconfig")[nvim_lsp].setup({})
        end

        setup("lua-language-server", {})
        setup("pyright", {})

        vim.cmd("LspStart")
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true
        })
    end
}
