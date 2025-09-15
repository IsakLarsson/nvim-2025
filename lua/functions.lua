local api = vim.api

local function telescope_error_diagnostics()
  require("telescope.builtin").diagnostics {
    {},
    severity = vim.diagnostic.severity.ERROR,
  }
end
api.nvim_create_user_command("SearchErrorDiagnostics", telescope_error_diagnostics, {})

local function insert_string_at_cursor(str)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row, col, row, col, { str })
end
vim.api.nvim_create_user_command("NOP", function()
  insert_string_at_cursor "(model , state , Cmd.none)"
end, {})
