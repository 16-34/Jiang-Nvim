-- 浮动终端
return {
    "voldikss/vim-floaterm",
    keys = function()
        local keymap = {}
        local os_name = vim.loop.os_uname().sysname

        if os_name == "Darwin" then
            table.insert(keymap, {
                "<C-`>",
                "<CMD>FloatermToggle<CR>",
                mode = {"n", "t"}
            })
        else
            table.insert(keymap, {
                "<A-`>",
                "<CMD>FloatermToggle<CR>",
                mode = {"n", "t"}
            })
        end

        return keymap
    end,
    config = function()
        vim.g.floaterm_autoclose = 2
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8

        vim.api.nvim_create_user_command('RunCode', function()
            vim.cmd("silent write")

            local ft = vim.bo.filetype
            if ft == 'python' then
                vim.cmd('FloatermNew --autoclose=0 python3 "%"')
            elseif ft == 'c' then
                vim.cmd('FloatermNew --autoclose=0 gcc "%" -g -o "%<" && "./%<"')
            elseif ft == 'cpp' then
                vim.cmd('FloatermNew --autoclose=0 g++ "%" -std=c++11 -g -o "%<" && "./%<"')
            else
                print('暂不支持的文件类型: ' .. ft)
            end
        end, {
            desc = "运行当前代码"
        })
    end,
    lazy = false
}
