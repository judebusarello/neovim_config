vim.cmd([[
  set fillchars+=diff:╱
  set diffopt=filler,context:50
]])
_G.Diffviewopen = false

return {
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
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "rcarriga/nvim-notify",
    enabled = true,
    config = function()
      local stages = require("notify.stages.fade")("top_down")
      local notify = require("notify")

      notify.setup({
        render = "minimal",
        stages = {
          function(...)
            local opts = stages[1](...)
            if opts then
              opts.border = "none"
              opts.row = opts.row + 1
            end
            return opts
          end,
          unpack(stages, 2),
        },
        timeout = 0,
      })
    end,
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
        vim.cmd.ToggleTerm,
        desc = "open scratch terminal",
        mode = "n",
      },
      {
        "<leader>k",
        vim.cmd.ToggleTerm,
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
      {
        "<leader>G",
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.55,
            results_width = 0.8,
          },
          height = 0.9,
          width = 0.87,
          preview_cutoff = 120,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        undo = {
          use_delta = true,
          side_by_side = true,
          layout_strategy = "horizontal",
        },
        project = {
          base_dirs = {
            "~/vistar",
            "~/docker-compose",
          },
          hidden_files = true,
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
        },
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
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
        telescope.load_extension("fzf")
        telescope.load_extension("undo")
        telescope.load_extension("project")
        telescope.load_extension("file_browser")
      end,
    },
    keys = {
      {
        "<leader>;",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "recently used files",
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep()
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
        "<leader>u",
        function()
          require("telescope").extensions.undo.undo()
        end,
        desc = "telescope undo",
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
      {
        "<leader>p",
        function()
          require("telescope").extensions.project.project({})
        end,
        desc = "project picker",
      },
      {
        "<leader>i",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "files staged in git",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    keys = {
      -- {
      --   "<leader>d",
      --   function()
      --     require("gitsigns").diffthis("HEAD~1")
      --   end,
      --   desc = "diff file from previous commit",
      --   mode = "n",
      -- },
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
  {
    "sindrets/diffview.nvim",
    enabled = true,
    opts = {
      enhanced_diff_hl = true,
    },
    keys = {
      {
        "<leader>D",
        function()
          if Diffviewopen == false then
            -- vim.cmd("DiffviewFileHistory")
            vim.cmd("DiffviewOpen HEAD^")
            Diffviewopen = true
          else
            vim.cmd("tabclose")
            Diffviewopen = false
          end
        end,
        desc = "code actions",
        mode = "n",
      },
      {
        "<leader>d",
        function()
          local mark = vim.api.nvim_buf_get_mark(0, '"')
          local lcount = vim.api.nvim_buf_line_count(0)
          if Diffviewopen == false then
            vim.cmd("DiffviewOpen")
            vim.cmd("DiffviewToggleFiles")
            Diffviewopen = true
          else
            vim.cmd("tabclose")
            Diffviewopen = false
          end
          if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
          end
        end,
        desc = "code actions",
        mode = "n",
      },
    },
  },
}
