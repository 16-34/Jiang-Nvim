-- 代码格式化
vim.pack.add({
    "https://github.com/stevearc/conform.nvim"
})

local ok, conform = pcall(require, "conform")
if not ok then
    return
end

conform.setup({
    format_on_save = function(bufnr)
        local formatters = conform.list_formatters_for_buffer(bufnr)

        return {
            timeout_ms = 3000,
            lsp_fallback = #formatters == 0,
        }
    end,
})
