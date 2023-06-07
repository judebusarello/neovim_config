vim.opt.fillchars:append({ diff = "╱" })
vim.opt.diffopt:append("filler")
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")
vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

_G.Diffviewopen = false

return {
  { "catppuccin/nvim", name = "catppuccin" },
  { "HiPhish/nvim-ts-rainbow2", enabled = true }, -- colorize parens and brackets
  { "folke/trouble.nvim", enabled = true },
  { "folke/zen-mode.nvim", enabled = true },
  { "kdheepak/lazygit.nvim", enabled = true },
  { "goolord/alpha-nvim", enabled = false }, -- Welcome screen
  { "echasnovski/mini.pairs", enabled = false }, -- This autotypes paired bracus
  { "echasnovski/mini.pairs", enabled = false }, -- This autotypes paired bracus
  { "nvim-neo-tree/neo-tree.nvim", enabled = false }, -- I prefer the telescope extension for this stuff
  { "folke/neodev.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false }, -- don't like statuslines
  { "echasnovski/mini.indentscope", enabled = false }, -- the animated scope lines were distracting
  { "L3MON4D3/LuaSnip", enabled = false }, -- Dunno what I'm doing with this
  { "SmiteshP/nvim-navic", enabled = false }, -- This shows data in the statusbar that I don't have
  { "folke/trouble.nvim", enabled = false }, -- this is a list of all the diagnostic errors etc. Don't use it
  { "RRethy/vim-illuminate", enabled = false }, -- underlines all the same words as under the cursor. I find this distracting.
  { "hrsh7th/cmp-buffer", enabled = false }, -- I don't want autocomplete to come from random words in the buffer
  { "hrsh7th/cmp-path", enabled = false }, -- I don't use filesystem paths frequently. More likely to mess me up than help me out.
  { "saadparwaiz1/cmp_luasnip", enabled = false }, -- I don't use luasnip. No need to have it for autocomplete
  { "ggandor/leap.nvim", enabled = true }, -- I don't use easymotions
  { "rmagatti/auto-session", enabled = false }, -- I don't use easymotions
  { "Bekaboo/deadcolumn.nvim", enabled = true }, -- show colorcolumn as you approach
  { "windwp/nvim-autopairs", enabled = false }, -- This seems like I can make this work how I want
  {
    "projekt0n/circles.nvim",
    enabled = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-treesitter",
    enabled = true,
    opts = {
      rainbow = {
        enable = true,
      },
    },
  },
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      messages = {
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
        view_error = "mini", -- view for errors
        view_warn = "mini", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = false, -- view for search count messages. Set to `false` to disable
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    enabled = true,
    config = function()
      local colorizer = require("colorizer")
      colorizer.setup({
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      }, { css = true, css_fn = true, mode = "foreground" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    keys = {
      {
        "m",
        vim.lsp.buf.definition,
        desc = "jump to definition",
        mode = "n",
      },
      {
        "M",
        vim.cmd.pop,
        desc = "jump back from definition",
        mode = "n",
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    enabled = true,
    opts = {
      direction = "float",
      auto_scroll = false,
      start_in_insert = true,
      float_opts = {
        border = "curved",
        width = 270,
        height = 55,
      },
    },
    keys = {
      {
        "<leader>j",
        function()
          require("toggleterm").toggle(1, 0, vim.loop.cwd(), "float")
        end,
        desc = "open scratch terminal",
        mode = "n",
      },
      {
        "<leader>k",
        function()
          require("toggleterm").toggle(2, 0, vim.loop.cwd(), "float")
        end,
        desc = "open scratch terminal",
        mode = "n",
      },
      {
        "<leader>l",
        function()
          require("toggleterm").toggle(2, 0, vim.loop.cwd(), "float")
        end,
        desc = "open scratch terminal",
        mode = "n",
      },
      {
        "<leader>mm",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local spotify = Terminal:new({ cmd = "spt", hidden = true })
          spotify:toggle()
        end,
        desc = "open spotify cli",
        mode = "n",
      },
      -- {
      --   "<leader>dd",
      --   function()
      --     local Terminal = require("toggleterm.terminal").Terminal
      --     local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })
      --     lazydocker:toggle()
      --   end,
      --   desc = "open lazydocker",
      --   mode = "n",
      -- },
      -- {
      --   "<leader>G",
      --   function()
      --     vim.cmd([[
      --     if has('nvim') && executable('nvr')
      --       let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
      --     endif
      --     ]])
      --     local Terminal = require("toggleterm.terminal").Terminal
      --     local lazygit = Terminal:new({
      --       cmd = "lazygit",
      --       hidden = true,
      --       direction = "float",
      --       start_in_insert = true,
      --     })
      --     lazygit:toggle()
      --   end,
      --   desc = "open lazygit",
      --   mode = "n",
      -- },
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
          null_ls.builtins.formatting.buildifier,
          null_ls.builtins.formatting.sql_formatter, -- not sure this is working
          -- null_ls.builtins.formatting.google_java_format, --not sure if this works? Not even sure if this is right to use in our code.
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.pyright,
          null_ls.builtins.diagnostics.vulture,
          null_ls.builtins.completion.spell,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.refactoring,
          -- null_ls.builtins.formatting.sqlfluff.with({
          --   extra_args = { "--dialect", "postgres" },
          -- }),
        },
      })
    end,
    keys = {
      {
        ";",
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
        show_close_icon = true,
        separator_style = "slant",
        always_show_bufferline = false,
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.35,
            results_width = 0.65,
          },
          height = 0.6,
          width = 0.75,
          preview_cutoff = 80,
        },
      },
      extensions = {
        file_browser = {
          cwd_to_path = false,
          grouped = false,
          files = true,
          add_dirs = true,
          auto_depth = true,
          hidden = { file_browser = false, folder_browser = false },
          collapse_dirs = false,
          prompt_path = false,
          quiet = false,
          dir_icon = "",
          dir_icon_hl = "Default",
          display_stat = { date = true, size = true, mode = true },
          use_fd = true,
          git_status = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
      config = function()
        local telescope = require("telescope")
        telescope.load_extension("file_browser")
      end,
    },
    keys = {
      {
        "<leader>/",
        function()
          -- require("telescope").extensions.fzf_writer.grep()
          require("telescope.builtin").live_grep()
          -- require("telescope.builtin").grep_string({
          --   shorten_path = true,
          --   word_match = "-w",
          --   only_sort_text = true,
          --   search = "",
          -- })
        end,
        desc = "fuzzy find all files in repo",
      },
      {
        "<leader>n",
        function()
          require("telescope.builtin").git_bcommits()
        end,
        desc = "commits to the file in this buffer",
      },
      {
        "<leader>e",
        function()
          require("telescope").extensions.file_browser.file_browser({
            cwd = vim.fn.expand("%:p:h"),
          })
        end,
        desc = "file browser for current folder",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    keys = {
      {
        "<leader>d",
        function()
          require("gitsigns").diffthis("HEAD~1")
        end,
        desc = "diff file from previous commit",
        mode = "n",
      },
      {
        "<leader>h",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
        desc = "show to commit message of the current line",
        mode = "n",
      },
    },
  },
}
