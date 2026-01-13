-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<A-k>", "<esc>k", { desc = "Move up" })
map("n", "<A-j>", "<esc>j", { desc = "Move down" })
map("i", "<A-k>", "<esc>gk", { desc = "Move up" })
map("i", "<A-j>", "<esc>gj", { desc = "Move down" })
map("v", "<A-k>", "<esc>gk", { desc = "Move up" })
map("v", "<A-j>", "<esc>gj", { desc = "Move down" })

pcall(vim.keymap.del, "n", "<leader>|")
vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

vim.keymap.set("n", "<leader>sx", function()
  Snacks.picker.resume()
end, { noremap = true, silent = true, desc = "resume" })
