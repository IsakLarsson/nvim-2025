require "nvchad.options"

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "yellow" })

local o = vim.o

o.cursorlineopt = "both" -- to enable cursorline!
o.confirm = true
