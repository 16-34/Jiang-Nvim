lsp = vim.lsp

lsp.enable("ruff")
lsp.enable("pyright")
lsp.enable("lua_ls")
lsp.enable("clangd")
lsp.enable("bashls")
lsp.enable("marksman")

-- 诊断信息
local virtual_lines_enabled = false

vim.diagnostic.config({
    -- virtual_text = {
    --     spacing = 4,        -- Distance between error text and the end of the code
    --     source = "if_many", -- Display the source of the error if there are multiple LSPs
    -- },
    severity_sort = true, -- Order Errors before Warnings
    virtual_lines = virtual_lines_enabled,

    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "Er",
            [vim.diagnostic.severity.WARN] = "Wa",
            [vim.diagnostic.severity.HINT] = "Hi",
            [vim.diagnostic.severity.INFO] = "In",
            -- [vim.diagnostic.severity.ERROR] = " ",
            -- [vim.diagnostic.severity.WARN] = " ",
            -- [vim.diagnostic.severity.HINT] = "󰌵 ",
            -- [vim.diagnostic.severity.INFO] = " ",
        },
    },
})

vim.keymap.set("n", "<leader>dv", function()
    virtual_lines_enabled = not virtual_lines_enabled
    vim.diagnostic.config({
        virtual_lines = virtual_lines_enabled,
    })
end, { desc = "开启/关闭诊断信息虚拟行" })


-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "lsp 帮助信息" })

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP 代码动作", })

-- 在新窗口跳转
local function vsplit_jump(fn)
    return function()
        vim.cmd("vsplit")
        fn()
    end
end

vim.keymap.set("n", "gd", vsplit_jump(vim.lsp.buf.definition), { desc = "LSP 转到定义", })
vim.keymap.set("n", "gt", vsplit_jump(vim.lsp.buf.type_definition), { desc = "LSP 转到类型定义", })
vim.keymap.set("n", "gr", vsplit_jump(vim.lsp.buf.references), { desc = "LSP 转到引用", })
vim.keymap.set("n", "gi", vsplit_jump(vim.lsp.buf.implementation), { desc = "LSP 转到实现", })

vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "LSP 下一个诊断", })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "LSP 上一个诊断", })

vim.keymap.set("n", "r", vim.lsp.buf.rename, { desc = "LSP 重命名", })
