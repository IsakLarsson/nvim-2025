-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",

  hl_override = {
    -- Comment = { italic = true },
    -- ["@comment"] = { italic = true },
    TelescopeSelection = { bg = "blue", fg = "one_bg" },
    Visual = { bg = "base04" },
  },
}

-- M.nvdash = { load_on_startup = true }

M.ui = {
  telescope = { style = "bordered" },
  statusline = {
    theme = "vscode_colored",
  },
  tabufline = {
    enabled = false,
  },
  cmp = {
    icons = true,
    style = "atom_colored",
    format_colors = {
      lsp = true,
    },
  },
}
return M
