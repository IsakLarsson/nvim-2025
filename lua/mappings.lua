require "nvchad.mappings"

-- add yours here

local nomap = vim.keymap.del
local map = vim.keymap.set

nomap("n", "<tab>")

map("n", ";", ":", { desc = "CMD enter command mode" })

-- BUFFERS --
map("n", "<leader>q", "<cmd>:q<cr>") -- Close buffer
map("n", "<leader>Q", "<cmd>:qa<cr>") -- Close all buffers

-- UTILS --
map("n", "U", "<C-r>") --Redo

-- GIT --
map("n", "<leader>gg", "<cmd>LazyGit<cr>")

-- TMUX --
map("n", "<C-H>", "<cmd><C-U>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
