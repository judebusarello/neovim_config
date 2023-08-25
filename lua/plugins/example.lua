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
  { "catppuccin/nvim",                     name = "catppuccin" },
  { "junegunn/fzf",                        build = "./install --bin" },
  { "HiPhish/nvim-ts-rainbow2",            enabled = true },  -- colorize parens and brackets
  { "Bekaboo/deadcolumn.nvim",             enabled = true },  -- show colorcolumn as you approach
  { "lukas-reineke/indent-blankline.nvim", enabled = true },  -- show colorcolumn as you approach
  { "echasnovski/mini.comment",            enabled = true },  --comment out visual selection
  { "nvim-lua/plenary.nvim",               enabled = false },
  { "L3MON4D3/LuaSnip",                    enabled = false }, -- Dunno what I'm doing with this
  { "folke/trouble.nvim",                  enabled = false },
  { "folke/todo-comments.nvim",            enabled = false },
  { "echasnovski/mini.ai",                 enabled = false }, --don't know how to use
  { "nvim-pack/nvim-spectre.nvim",         enabled = false },
  { "folke/zen-mode.nvim",                 enabled = false },
  { "folke/flash.nvim",                    enabled = false },
  { "kdheepak/lazygit.nvim",               enabled = false },
  { "goolord/alpha-nvim",                  enabled = false }, -- Welcome screen
  { "echasnovski/mini.pairs",              enabled = false }, -- This autotypes paired bracus
  { "echasnovski/mini.pairs",              enabled = false }, -- This autotypes paired bracus
  { "nvim-neo-tree/neo-tree.nvim",         enabled = false }, -- I prefer the telescope extension for this stuff
  { "folke/neodev.nvim",                   enabled = false },
  { "nvim-lualine/lualine.nvim",           enabled = false }, -- don't like statuslines
  { "echasnovski/mini.indentscope",        enabled = false }, -- the animated scope lines were distracting
  { "SmiteshP/nvim-navic",                 enabled = false }, -- This shows data in the statusbar that I don't have
  { "folke/trouble.nvim",                  enabled = false }, -- this is a list of all the diagnostic errors etc. Don't use it
  { "RRethy/vim-illuminate",               enabled = false }, -- underlines all the same words as under the cursor. I find this distracting.
  { "hrsh7th/cmp-buffer",                  enabled = false }, -- I don't want autocomplete to come from random words in the buffer
  { "hrsh7th/cmp-path",                    enabled = false }, -- I don't use filesystem paths frequently. More likely to mess me up than help me out.
  { "hrsh7th/cmp-vsnip",                   enabled = true },  -- I don't use filesystem paths frequently. More likely to mess me up than help me out.
  { "hrsh7th/vim-vsnip",                   enabled = true },  -- I don't use filesystem paths frequently. More likely to mess me up than help me out.
  { "saadparwaiz1/cmp_luasnip",            enabled = false }, -- I don't use luasnip. No need to have it for autocomplete
  { "ggandor/leap.nvim",                   enabled = false }, -- I don't use easymotions
  { "rmagatti/auto-session",               enabled = false }, -- I don't use easymotions
  { "windwp/nvim-autopairs",               enabled = false }, -- This seems like I can make this work how I want
  { "nvim-telescope/telescope.nvim",       enabled = false },
  { "jose-elias-alvarez/null-ls.nvim",     enabled = false },
  {
    "nvimdev/guard.nvim",
    enabled = true,
    config = function()
      local ft = require('guard.filetype')
      ft('python'):fmt({ cmd = '/home/jude/vistar/ci/fmt-python', args = { 'fix' }, fname = false, stdin = false })
      require('guard').setup({})
    end,
    opts = {
      fmt_on_save = true,
      lsp_as_default_formatter = false,
    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        "max-perf",
        winopts = {
          border = "FloatBorder",
          width = 0.8,
          height = 0.7,
          preview = {
            -- hidden = "hidden",
            border = "noborder",
            wrap = "wrap",
            scrollbar = true,
            layout = "horizontal",
            title = false,
            horizontal = "left:40%",
          },
        },
      })
    end,
    keys = {
      {
        "<leader><leader>",
        function()
          require("fzf-lua").git_files({ multiprocess = true })
        end,
        mode = "n",
      },
      {
        "<leader>e",
        function()
          require("fzf-lua").files({ cwd = vim.api.nvim_buf_get_name(0) })
        end,
        mode = "n",
      },
      {
        "<leader>f",
        function()
          require("fzf-lua").grep_visual({ multiprocess = true })
        end,
        mode = "v",
      },
      {
        "<leader>f",
        function()
          require("fzf-lua").lsp_finder({ multiprocess = true })
        end,
        mode = "n",
      },
      {
        "<leader>o",
        function()
          require("fzf-lua").oldfiles({ multiprocess = true })
        end,
        mode = "n",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").grep_project({ multiprocess = true })
        end,
        mode = "n",
      },
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
        enabled = true,            -- enables the Noice messages UI
        view = "mini",             -- default view for messages
        view_error = "mini",       -- view for errors
        view_warn = "mini",        -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = false,       -- view for search count messages. Set to `false` to disable
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
        "<leader>mm",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local spotify = Terminal:new({ cmd = "spt", hidden = true })
          spotify:toggle()
        end,
        desc = "open spotify cli",
        mode = "n",
      },
      {
        "<S-esc>",
        function()
          require("toggleterm").toggle(2, 0, vim.loop.cwd(), "float")
        end,
        desc = "close terminal",
        mode = "n",
      },
      {
        "<S-esc>",
        function()
          require("toggleterm").toggle(2, 0, vim.loop.cwd(), "float")
        end,
        desc = "close terminal",
        mode = "t",
      },
      {
        "<leader>g",
        function()
          vim.cmd([[
          if has('nvim') && executable('nvr')
            let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
          endif
          ]])
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            start_in_insert = true,
          })
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
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api
            .nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]
            :match("^%s*$")
            == nil
      end
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,

            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        mapping = cmp.mapping.preset.insert({
          [";"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          ["S-<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "copilot" },
        }, {
          { name = "spell" },
        }),
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        python = true,
        javascript = true,
        typescript = true,
        help = true,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter({})
        end
      end)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettier")
      table.insert(opts.ensure_installed, "buildifier")
      table.insert(opts.ensure_installed, "gopls")
      table.insert(opts.ensure_installed, "json-lsp")
      table.insert(opts.ensure_installed, "lua-language-server")
      table.insert(opts.ensure_installed, "python-lsp-server")
      table.insert(opts.ensure_installed, "typescript-language-server")
      table.insert(opts.ensure_installed, "isort")
    end,
  },
  { "williamboman/mason-lspconfig.nvim", enabled = true },
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    keys = {
      {
        "<leader>r",
        vim.lsp.buf.rename,
        desc = "rename variable under cursor",
        mode = "n",
      },
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
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
  { "stevearc/dressing.nvim",            enabled = true }, --this makes the rename dialog appear right over the thing you're renaming instead of the command line
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
    "lewis6991/gitsigns.nvim",
    enabled = true,
    keys = {
      {
        "<leader>D",
        function()
          require("gitsigns").diffthis()
        end,
        desc = "see what changed on that line based on the changes made",
        mode = "n",
      },
      {
        "<leader>d",
        function()
          require("gitsigns").preview_hunk_inline()
        end,
        desc = "see what changed on that line based on the changes made",
        mode = "n",
      },
      -- {
      --   "D",
      --   function()
      --     require("gitsigns").reset_hunk()
      --   end,
      --   desc = "reset the hunk to what it use to be",
      --   mode = "n",
      -- },
      {
        "<leader>b",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
        desc = "show to commit message of the current line",
        mode = "n",
      },
    },
    config = function()
      require("gitsigns").setup({
        base = "HEAD~1",
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 1,
          col = 1,
        },
      })
    end,
  },
}
