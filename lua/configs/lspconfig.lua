require("nvchad.configs.lspconfig").defaults()

local lspconfig = vim.lsp.config
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "elmls", "biome", "lua_ls", "tailwindcss", "gleam", "ts_ls" }

lspconfig.tailwindcss = {
  -- on_attach = on_attach,
  -- capabilities = capabilities,
  filetypes = { "html", "elm" },
  root_dir = nil,
  root_markers = { ".git" },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        elm = "html",
        html = "html",
      },
      classAttributes = { "class", "className", "classList", "ngClass" },
      experimental = {
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
