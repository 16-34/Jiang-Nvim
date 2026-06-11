-- 代码折叠
vim.pack.add({
  "https://github.com/kevinhwang91/nvim-ufo",
  "https://github.com/kevinhwang91/promise-async",
})

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ok, ufo = pcall(require, "ufo")
if not ok then
  return
end

ufo.setup()

vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Ufo 展开所有折叠" })
vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Ufo 关闭所有折叠" })
