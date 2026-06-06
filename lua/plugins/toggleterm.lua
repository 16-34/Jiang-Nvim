-- 终端切换
vim.pack.add({
  "https://github.com/akinsho/toggleterm.nvim",
})

local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup({
  direction = "float",
  float_opts = {
    border = "rounded",
    width = function()
      return math.floor(vim.o.columns * 0.6)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.6)
    end,
    winblend = 0,
  },
  open_mapping = [[<c-`>]],
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  close_on_exit = false,
})

-- 额外设置，确保终端模式下也能切换
vim.keymap.set("t", "<C-`>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { desc = "ToggleTerm 切换终端" })
vim.keymap.set("n", "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "ToggleTerm 切换终端" })
