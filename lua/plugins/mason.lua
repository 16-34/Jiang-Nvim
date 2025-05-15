-- LSP 服务器
-- requirements:
-- -- Unix:
-- -- -- git
-- -- -- curl / wget
-- -- -- unzip
-- -- -- GNU tar (tar / gtar depending on platform)
-- -- -- gzip
-- -- Windows:
-- -- -- pwsh / powershell
-- -- -- git
-- -- -- GNU tar
-- -- -- 7zip / peazip / archiver / winzip / WinRAR
return {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    event = "VeryLazy",
    dependencies = {"neovim/nvim-lspconfig", {
        "mason-org/mason-lspconfig.nvim",
        version = "^1.0.0"
    }},
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    },
    config = function(_, opts)
        require("mason").setup(opts)
        local registry = require("mason-registry")

        local function setup(lsp_name, config)
            local success, package = pcall(registry.get_package, lsp_name)
            if success and not package:is_installed() then
                package:install()
            end

            local nvim_lsp = require("mason-lspconfig.mappings.server").package_to_lspconfig[lsp_name]
            config.capabilities = require("blink.cmp").get_lsp_capabilities()
            require("lspconfig")[nvim_lsp].setup(config)
        end

        setup("lua-language-server", {})

        setup("pyright", {})
        setup("ruff", {})

        setup("clangd", {})

        vim.cmd("LspStart")
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true
        })
    end
}
