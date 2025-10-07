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
    -- preview = { hidden = "hidden" },
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
        horizontal = "down:40%",
        wrap = "wrap",
      },
    },
    cwd_only = true,
    symbols = {
      locate = true,
    },
  },
}

return M
