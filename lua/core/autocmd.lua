-- 自动格式化
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        -- 仅当 buffer 有 attached 的 LSP 并且支持格式化时才调用
        local clients = vim.lsp.get_clients({
            bufnr = args.buf
        })
        local has_formatter = false

        -- 检查是否有客户端支持 formatting
        for _, client in ipairs(clients) do
            if client.supports_method("textDocument/formatting") then
                has_formatter = true
                break
            end
        end
        if has_formatter then
            vim.lsp.buf.format({
                async = false, -- 同步格式化（确保保存前完成）
                filter = function(client)
                    return client.name ~= "tsserver" -- 可选：过滤掉特定 LSP（如 tsserver 通常不建议用于格式化）
                end
            })
        end
    end
})
