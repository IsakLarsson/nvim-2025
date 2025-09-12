return {
  { import = "nvchad.blink.lazyspec" },
  { "folke/which-key.nvim", enabled = false },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    event = "BufEnter",
    config = function()
      require("fzf-lua").setup { "ivy" }
    end,
  },
  {
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module 'undotree.collector'
    ---@type UndoTreeCollector.Opts
    opts = {
      -- your options
    },
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "harpoon file",
      },
      {
        "<leader>a",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>n",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>e",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>i",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>o",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },

    keys = {
      {
        "<C-H>",
        "<cmd>TmuxNavigateLeft<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<C-L>",
        "<cmd>TmuxNavigateRight<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<C-J>",
        "<cmd>TmuxNavigateDown<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<C-K>",
        "<cmd>TmuxNavigateUp<cr>",
        desc = "Symbols (Trouble)",
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "elm",
      },
      auto_install = true,
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = { enabled = false },
        char = { multi_line = false, highlight = { backdrop = false } },
      },
      highlight = {
        backdrop = true,
      },
    },
    keys = {
      {
        "<leader>s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "<leader>S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-t>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "gbprod/substitute.nvim",
    opts = {
      highlight_substituted_text = {
        timer = 50,
      },
    },
    keys = {
      {
        "s",
        mode = "n",
        function()
          require("substitute").operator()
        end,
        desc = "Substitute",
      },
      {
        "ss",
        mode = "n",
        function()
          require("substitute").line()
        end,
        desc = "Substitute Line",
      },
      {
        "S",
        mode = "n",
        function()
          require("substitute").eol()
        end,
        desc = "Substitute to end of line",
      },
      {
        "sx",
        mode = "n",
        function()
          require("substitute.exchange").operator()
        end,
      },
      {
        "sxx",
        mode = "n",
        function()
          require("substitute.exchange").line()
        end,
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = {
      "VeryLazy",
    },
  },
}
