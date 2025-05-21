-- -- 配置
local opt = vim.opt

-- 行号
-- opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 关闭自动换行
opt.wrap = false

-- 光标行
opt.cursorline = true

opt.colorcolumn = "80"

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
-- opt.signcolumn = "yes"

-- 自动重新加载
opt.autoread = true

-- 禁止生成交换文件
vim.o.swapfile = false

