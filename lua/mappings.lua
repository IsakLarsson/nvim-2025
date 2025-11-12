require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- BUFFERS --
map("n", "<leader>q", "<cmd>:q<cr>") -- Close buffer
map("n", "<leader>Q", "<cmd>:qa<cr>") -- Close all buffers

-- UTILS --
map("n", "<leader>gb", "<cmd>Gitsigns blame<cr>")
map("n", "<leader>rr", ":%s/<C-r><C-w>/") -- Start replace on current word
map("n", "<BS>", "<C-o>")
map("n", "]c", ":Gitsigns next_hunk<cr>")
map("n", "[c", ":Gitsigns prev_hunk<cr>")

-- QOL --
map("n", "x", '"_x"') -- Delete character to black hole buffer
map("n", "Q", "@q") -- Quickli run q macro
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("n", "U", "<C-r>") --Redo
map("n", "<leader>v", "<C-w>v")

-- GIT --
map("n", "<leader>gg", "<cmd>LazyGit<cr>")
map("n", "<leader>do", "<cmd>DiffviewOpen<cr>")
map("n", "<leader>dc", "<cmd>DiffviewClose<cr>")

-- TMUX --
map("n", "<C-H>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-- LSP --
map("n", "<leader>rs", "<cmd>:LspRestart<CR>")
map("n", "<leader>ca", "<cmd>:FzfLua lsp_code_actions<CR>")

-- Finding stuff --
map("n", "<leader>fg", "<cmd>:FzfLua lsp_document_symbols<cr>")
map("n", "<leader>ff", "<cmd>:FzfLua files<cr>")
map("n", "<leader>fw", "<cmd>:FzfLua live_grep_native<cr>")

map("n", "<leader>fd", function()
  vim.diagnostic.open_float { border = "rounded" }
end)
