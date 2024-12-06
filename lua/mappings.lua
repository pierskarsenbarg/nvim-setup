require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({"n", "v"}, "<leader>mp", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
