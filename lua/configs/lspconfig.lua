require("nvchad.configs.lspconfig").defaults()

local lspconfig = vim.lsp.config

local servers = {
  "html",
  "cssls",
  "elmls",
  "biome",
  "lua_ls",
  "tailwindcss",
  "gleam",
  "ts_ls",
  "gopls",
  "gofumpt",
  "pylsp",
  "omnisharp",
}

-- vim.lsp.enable(servers)

lspconfig.tailwindcss = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "elm",
    "html",
    "php",
    "css",
    "scss",
    "javascript",
    "typescript",
  },
  root_markers = {
    ".git",
  },
  init_options = {
    userLanguages = {
      elm = "html",
      html = "html",
    },
  },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        elm = "html",
        html = "html",
      },
      classAttributes = { "class", "className", "classList", "ngClass" },
      experimental = {
        configFile = "../shared/css/style.css",
        classRegex = {
          '\\bclass[\\s(<|]+"([^"]*)"',
          '\\bclass[\\s(]+"[^"]*"[\\s+]+"([^"]*)"',
          '\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
          '\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
          '\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
          '\\bclassList[\\s\\[\\(]+"([^"]*)"',
          '\\bclassList[\\s\\[\\(]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"([^"]*)"',
          '\\bclassList[\\s\\[\\(]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"([^"]*)"',
        },
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
}
-- read :h vim.lsp.config for changing options of lsp servers
vim.lsp.enable(servers)
