-- UI 美化
vim.pack.add({
    "https://github.com/folke/noice.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    -- "https://github.com/rcarriga/nvim-notify",
})

local ok, noice = pcall(require, "noice")
if not ok then
    return
end

noice.setup({
    views = {
        cmdline_popup = {
            position = {
                row = "35%",
                col = "50%"
            },
        },
    },
    presets = {
        lsp_doc_border = true,
    },
})
