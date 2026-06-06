-- 光标移动
vim.pack.add({
  "https://github.com/folke/flash.nvim",
})

local ok, flash = pcall(require, "flash")
if not ok then
  return
end

flash.setup({
  modes = {
    char = {
      enabled = false,
    },
    search = {
      enabled = false,
    },
  },
})

vim.keymap.set({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash", })
-- vim.keymap.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter", })
-- vim.keymap.set("o", "r", flash.remote, { desc = "Remote Flash", })
-- vim.keymap.set({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter Search", })
-- vim.keymap.set("c", "<C-s>", flash.toggle, { desc = "Toggle Flash Search", })


vim.api.nvim_set_hl(0, "FlashLabel", {
  fg = "#000000",
  bg = "#ffffff",
  bold = true,
})

vim.api.nvim_set_hl(0, "FlashMatch", {
  fg = "#ffffff",
  bg = "NONE",
  bold = true,
})

vim.api.nvim_set_hl(0, "FlashCurrent", {
  -- link = "FlashMatch"
  fg = "#FF5722",
  bg = "NONE",
  bold = true,
})

vim.api.nvim_set_hl(0, "FlashBackdrop", {
  fg = "#555555",
  bg = "NONE"
})
