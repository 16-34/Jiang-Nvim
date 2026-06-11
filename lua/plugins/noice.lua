-- UI 美化
vim.pack.add({
    "https://github.com/folke/noice.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
})

local ok, noice = pcall(require, "noice")
if not ok then
    return
end

local notify_ok, notify = pcall(require, "notify")
if notify_ok then
    notify.setup({ background_colour = "#000000", })
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
    messages = { enabled = true },
    cmdline = { enabled = true },
    notify = { enabled = false },
    popupmenu = { enabled = false },
    presets = {
        lsp_doc_border = true,
    },
    lsp = {
        progress = { enabled = false },
    },
})
