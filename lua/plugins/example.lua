return {
  { "folke/trouble.nvim", enabled = true },
  { "folke/zen-mode.nvim", enabled = true },
  { "goolord/alpha-nvim", enabled = true }, -- Welcome screen
  { "echasnovski/mini.pairs", enabled = true }, -- This autotypes paired bracus
  { "folke/neodev.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false }, -- don't like statuslines
  { "echasnovski/mini.indentscope", enabled = false }, -- the animated scope lines were distracting
  { "L3MON4D3/LuaSnip", enabled = false }, -- Dunno what I'm doing with this
  { "SmiteshP/nvim-navic", enabled = false }, -- This shows data in the statusbar that I don't have
  { "folke/trouble.nvim", enabled = false }, -- this is a list of all the diagnostic errors etc. Don't use it
  { "RRethy/vim-illuminate", enabled = false }, -- underlines all the same words as under the cursor. I find this distracting.
  { "rcarriga/nvim-notify", enabled = false }, -- I don't like the fancy notifications. Bottom right is just fine by me
  { "hrsh7th/cmp-buffer", enabled = false }, -- I don't want autocomplete to come from random words in the buffer
  { "hrsh7th/cmp-path", enabled = false }, -- I don't use filesystem paths frequently. More likely to mess me up than help me out.
  { "saadparwaiz1/cmp_luasnip", enabled = false }, -- I don't use luasnip. No need to have it for autocomplete
  { "ggandor/leap.nvim", enabled = false }, -- I don't use easymotions

  {
    "neovim/nvim-lspconfig",
    enabled = true,
    keys = {
      {
        "<leader>z",
        vim.lsp.buf.definition,
        desc = "code actions",
        mode = "n",
      },
      {
        "<leader>Z",
        vim.cmd.pop,
        desc = "code actions",
        mode = "n",
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    enabled = true,
    opts = {
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
    keys = {
      {
        "<esc><esc>",
        vim.cmd.ToggleTermToggleAll,
        desc = "code actions",
        mode = "t",
      },
      {
        "<leader>j",
        vim.cmd.ToggleTerm,
        desc = "code actions",
        mode = "n",
      },
      {
        "<leader>dd",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ cmd = "lazydocker", hidden = true })
          lazygit:toggle()
        end,
        desc = "open lazydocker",
        mode = "n",
      },
      {
        "<leader>gg",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
          lazygit:toggle()
        end,
        desc = "open lazygit",
        mode = "n",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          [";"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
          { name = "spell" },
        }),
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = true,
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.yapf,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.jq,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.pyright,
          null_ls.builtins.completion.spell,
          null_ls.builtins.code_actions.gitsigns,
        },
      })
    end,
    keys = {
      {
        "<leader>cx",
        vim.lsp.buf.code_action,
        desc = "code actions",
        mode = "n",
      },
    },
  },

  {
    "LazyVim/LazyVim",
    enabled = true,
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    opts = {
      options = {
        diagnostics = false,
        show_close_icon = false,
        separator_style = "slant",
        always_show_bufferline = true,
      },
    },
    keys = {
      {
        "x",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "delete current buffer",
        mode = "n",
      },
      {
        "X",
        function()
          vim.cmd([[b#]])
        end,
        desc = "undo delete current buffer",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "descending",
      },
    },
    keys = {
      {
        "<leader>;",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "recently used files",
      },
      {
        "<leader>o",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "recently used files",
      },
      {
        "<leader>a",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("%:p:h"),
          })
        end,
        desc = "files in current folder",
      },
      {
        "<leader>i",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "files in git status",
      },
      {
        "<leader>n",
        function()
          require("telescope.builtin").git_bcommits()
        end,
        desc = "commits to the file in this buffer",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    keys = {
      {
        "<leader>gb",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
        desc = "show to commit message of the current line",
        mode = "n",
      },
      {
        "<leader>gB",
        function()
          require("gitsigns").diffthis("~")
        end,
        desc = "diff file from git status",
        mode = "n",
      },
      {
        "<leader>gD",
        function()
          require("gitsigns").diffthis("HEAD~1")
        end,
        desc = "diff file from previous commit",
        mode = "n",
      },
    },
  },
}
-- {
--   "voldikss/vim-floaterm",
--   enabled = true,
--   keys = {
--     {
--       "<leader>k",
--       function()
--         vim.cmd("FloatermToggle " .. "Terminal 2")
--       end,
--       desc = "open scratch terminal",
--     },
--   },
--   config = function()
--     vim.cmd([[hi FloatermBorder guifg=#89B4FA]])
--     vim.g.floaterm_height = 0.82
--     vim.g.floaterm_width = 0.8
--     vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
--   end,
-- },
