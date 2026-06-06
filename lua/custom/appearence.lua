-- 配色
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "Normal", {
    bg = "NONE"
})
vim.api.nvim_set_hl(0, "StatusLine", {
    fg = "#ffffff",
    bg = "NONE",
    bold = true
})

-- 全局浮窗边框，Neovim 0.11+
vim.o.winborder = "rounded"

vim.api.nvim_set_hl(0, "NormalFloat", {
    fg = "#ffffff",
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "FloatBorder", {
    fg = "#ffffff",
    bg = "NONE",
})

-- 窗格线
vim.api.nvim_set_hl(0, "WinSeparator", {
    fg = "#ffffff",
    bg = "NONE",
    -- bold = true,
})

-- 状态栏
vim.opt.laststatus = 3
-- vim.opt.cmdheight = 0
vim.opt.showmode = false

-- icon 模式 --
require("utils.status-line-icon")

-- -- 纯文本模式 --
-- require("utils.status-line-text")
