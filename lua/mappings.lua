require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- BUFFERS --
map("n", "<leader>q", "<cmd>:q<cr>") -- Close buffer
map("n", "<leader>Q", "<cmd>:qa<cr>") -- Close all buffers

-- UTILS --
map("n", "U", "<C-r>") --Redo

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
