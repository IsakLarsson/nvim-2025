local ok, fzf = pcall(require, "fzf-lua")
if not ok then
  return
end

M = {}

M.opts = {
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    },
  },
  winopts = {
    height = 0.4,
    width = 0.8,
    row = 0.5,
    border = "rounded",
    treesitter = { enabled = true },
  },
  fzf_opts = {
    ["--no-info"] = "",
    ["--info"] = "hidden",
    ["--padding"] = "13%,5%,13%,5%",
    ["--no-header"] = "",
    ["--no-scrollbar"] = "",
  },
  files = {
    formatter = "path.filename_first",
    git_icons = true,
    prompt = "> ",
    no_header = true,
    cwd_header = false,
    cwd_prompt = false,
    winopts = {
      title = " files 📑 ",
      title_pos = "center",
      title_flags = false,
    },
  },
  live_grep_native = {
    {
      formatter = "path.filename_first",
      git_icons = true,
      prompt = "> ",
      no_header = true,
      cwd_header = false,
      cwd_prompt = false,
      winopts = {
        title = " Grep",
        title_pos = "center",
        title_flags = false,
      },
      grep = {},
    },
  },
  diagnostics = {
    prompt = "Diagnostics",
    severity_limit = "error",
  },
  lsp = {
    formatter = "path.filename_first",
    winopts = {
      title = "LSP ✨ ",
      title_pos = "center",
      height = 0.6,
      preview = {
        wrap = true,
      },
    },
    cwd_only = true,
    symbols = {
      locate = true,
    },
  },
}

M.keys = {
  {
    "<leader>da",
    function()
      fzf.lsp_workspace_diagnostics()
    end,
    desc = "Fzf LSP diagnostics",
  },
  {
    "gf",
    function()
      fzf.lsp_references()
    end,
    desc = "Fzf LSP references",
  },
  {

    "<leader>p",
    function()
      fzf.files()
    end,
    desc = "Fzf LSP files",
  },
}

return M
