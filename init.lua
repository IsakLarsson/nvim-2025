vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"
require "functions"

vim.schedule(function()
  require "mappings"
end)

--Rounded lsp hover borders
local orig_util = vim.lsp.util.open_floating_preview

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util(contents, syntax, opts, ...)
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("fzf-lua").files()
  end,
})

--GODOT Server setup

local sock = "./godothost"
local projectfile = vim.fn.getcwd() .. "/project.godot"

if vim.fn.filereadable(projectfile) == 1 then
  local existing_servers = vim.fn.serverlist()
  local already_running = vim.tbl_contains(existing_servers, sock)

  if not already_running then
    local ok, err = pcall(vim.fn.serverstart, sock)
    if ok then
      vim.notify("Started godothost server ✅", vim.log.levels.INFO)
    else
      vim.notify("Failed to start godothost: " .. tostring(err), vim.log.levels.ERROR)
    end
  else
    vim.notify("godothost server already running 🟢", vim.log.levels.INFO)
  end
end
