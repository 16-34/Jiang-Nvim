-- 自动切换输入法(需要安装 im-select/macism)
if vim.g.neovide then
  return
end

vim.pack.add({
  "https://github.com/keaising/im-select.nvim",
})

local ok, im_select = pcall(require, "im_select")
if not ok then
  return
end

im_select.setup()
