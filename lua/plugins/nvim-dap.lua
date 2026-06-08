-- 调试器
vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",
    -- "https://github.com/theHamsta/nvim-dap-virtual-text",
})

local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
    return
end

local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
    return
end

dapui.setup({
    expand_lines = false,
    layouts = {
        {
            position = 'left',
            size = 0.2,
            elements = {
                { id = 'scopes',      size = 0.4 },
                { id = 'watches',     size = 0.3 },
                { id = 'stacks',      size = 0.15 },
                { id = 'breakpoints', size = 0.15 },
            },
        },
        {
            position = 'bottom',
            size = 0.3,
            elements = {
                { id = 'repl',    size = 0.3 },
                { id = 'console', size = 0.7 },
            },
        },
    },
})

dap.listeners.after.event_initialized["dapui"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui"] = function()
    dapui.close()
end

-- 断点图标
vim.fn.sign_define(
    'DapBreakpoint',
    { text = 'B', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' }
)
vim.fn.sign_define(
    'DapBreakpointCondition',
    { text = 'B', texthl = 'DapBreakpointCondition', linehl = '', numhl = 'DapBreakpointCondition' }
)
vim.fn.sign_define(
    'DapStopped',
    { text = '', texthl = '', linehl = 'DapStopped', numhl = '' }
)

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#ff2222", bold = true, })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#ffbb00", bold = true, })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#5d5dff", bg = "#ffffff", bold = true, })

vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Dap 切换调试窗口" })
vim.keymap.set('n', '<leader>dU', function()
    dapui.open({ reset = true })
end, { desc = 'Dap 重置调试窗口' })
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Dap 开始/继续调试" })
vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Dap 运行到光标处" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Dap 终止调试" })
vim.keymap.set("n", "<leader>dr", dap.restart_frame, { desc = "Dap 重启调试" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Dap 逐过程（step_over）" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Dap 单步进入（step_into）" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Dap 单步跳出（step_out）" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Dap 切换断点" })
vim.keymap.set("n", "<leader>dB", function()
    local input = vim.fn.input '断点条件:'
    dap.set_breakpoint(input)
end, { desc = "Dap 条件断点" })
vim.keymap.set('n', '<leader>dD', dap.clear_breakpoints, { desc = 'DAP 清空断点' })

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Dap 开始/继续调试" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Dap 逐过程（step_over）" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Dap 单步进入（step_into）" })
vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "Dap 单步跳出（step_out）" })

-- python 调试配置
vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap-python",
})

local dap_python_ok, dap_python = pcall(require, 'dap-python')
if dap_python_ok then
    dap_python.setup("python")
end

-- C/C++ 调试配置
dap.adapters.lldb = {
    type = "executable",
    command = "lldb-dap",
    name = "lldb",
}

dap.adapters.codelldb = {
    type = "executable",
    command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

    -- On windows you may have to uncomment this:
    -- detached = false,
}
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.cpp = {
    {
        name = "Launch（lldb）",
        type = "lldb",
        request = "launch",
        program = function()
            local file = vim.fn.expand("%:t:r")
            return vim.fn.input(
                "可执行文件路径: ",
                vim.fn.getcwd() .. "/" .. file,
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
    {
        name = "Launch (gdb)",
        type = "gdb",
        MIMode = "gdb",
        request = "launch",
        miDebuggerPath = vim.fn.exepath("gdb"),
        program = function()
            local file = vim.fn.expand("%:t:r")
            return vim.fn.input(
                "可执行文件路径: ",
                vim.fn.getcwd() .. "/" .. file,
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        setupCommands = {
            {
                description = "为 gdb 启用美化打印",
                ignoreFailures = true,
                text = "-enable-pretty-printing",
            },
        },
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Launch (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function()
            local file = vim.fn.expand("%:t:r")
            return vim.fn.input(
                "可执行文件路径: ",
                vim.fn.getcwd() .. "/" .. file,
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

dap.configurations.c = dap.configurations.cpp
