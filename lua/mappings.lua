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

-- QOL --
map("n", "x", '"_x"') -- Delete character to black hole buffer
map("n", "Q", "@q") -- Quickli run q macro
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- GIT --
map("n", "<leader>gg", "<cmd>LazyGit<cr>")

-- TMUX --
map("n", "<C-H>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-- LSP --
map("n", "<leader>rs", "<cmd>:LspRestart<CR>")

-- Finding stuff --
map("n", "<leader>fg", "<cmd>:FzfLua lsp_document_symbols<cr>")
map("n", "<leader>ff", "<cmd>:FzfLua files<cr>")

-- DIAGNOSTICS --
map("n", "<leader>fd", function()
  vim.diagnostic.open_float { border = "rounded" }
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
