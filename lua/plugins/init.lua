return {
  { import = "nvchad.blink.lazyspec" },
  { "folke/which-key.nvim", enabled = false },
  { "nvim-telesope/telescope.nvim", enabled = false },
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
    event = "BufEnter",
    opts = function()
      return require("configs.fzf").opts
    end,
    keys = function()
      return require("configs.fzf").keys
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
        char = { multi_line = false, highlight = { backdrop = false }, jump_labels = true },
      },
      highlight = {
        backdrop = true,
      },
    },
    keys = {
      {
        "<leader>fd",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            matcher = function(win)
              ---@param diag Diagnostic
              return vim.tbl_map(function(diag)
                return {
                  pos = { diag.lnum + 1, diag.col },
                  end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
                }
              end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
            end,
            action = function(match, state)
              vim.api.nvim_win_call(match.win, function()
                vim.api.nvim_win_set_cursor(match.win, match.pos)
                vim.diagnostic.open_float()
              end)
              state:restore()
            end,
          }
        end,
        desc = "Flash",
      },
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
