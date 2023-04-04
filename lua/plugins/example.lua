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
  { "rmagatti/auto-session", enabled = true }, -- I don't use easymotions
  { "Bekaboo/deadcolumn.nvim", enabled = true }, -- show colorcolumn as you approach
  { "windwp/nvim-autopairs", enabled = true }, -- This seems like I can make this work how I want
  -- { "pocco81/auto-save.nvim", enabled = true }, -- This seems like I can make this work how I want
  -- { "anuvyklack/pretty-fold.nvim", enabled = true }, -- I don't use easymotions

  -- { "projekt0n/circles.nvim", enabled = true,
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  -- },

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
          local Terminal = require("toggleterm.terminal").Terminal
          local term1 = Terminal:new({})
          term1:toggle()
        end,
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
  -- not Working. It will show you and store clipboard yanks
  -- {
  --   "AckslD/nvim-neoclip.lua",
  --   enabled = true,
  --   dependencies = {
  --     "kkharji/sqlite.lua",
  --   },
  --   opts = {
  --     enable_persistent_history = true,
  --   },
  --   keys = {
  --     {
  --       "P",
  --       function()
  --         require("neoclip")()
  --       end,
  --       desc = "delete current buffer",
  --       mode = "n",
  --     },
  --   },
  -- },
  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzf-writer.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = false,
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = {
          "kkharji/sqlite.lua",
        },
        opts = {
          extensions = {
            frecency = {
              show_scores = false,
              show_unindexed = true,
              ignore_patterns = { "*.git/*" },
              disable_devicons = false,
            },
          },
        },
      },
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
        fzf_writer = {
          minimum_grep_characters = 2,
          minimum_files_characters = 2,

          -- Disabled by default.
          -- Will probably slow down some aspects of the sorter, but can make color highlights.
          -- I will work on this more later.
          use_highlighter = true,
        },
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
        telescope.load_extension("gh")
        telescope.load_extension("fzf")
        telescope.load_extension("fzf_writer")
        telescope.load_extension("undo")
        telescope.load_extension("project")
        telescope.load_extension("file_browser")
        telescope.load_extension("frecency")
      end,
    },
    keys = {
      {
        "<leader>GG",
        function()
          require("telescope").extensions.gh.gist()
        end,
        desc = "recently used files",
      },
      {
        "<leader>f",
        function()
          require("telescope").extensions.frecency.frecency()
        end,
        desc = "frequently used files",
      },
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
      -- let's find a way to do all my git stuff with lazygit
      -- {
      --   "<leader>i",
      --   function()
      --     require("telescope.builtin").git_status()
      --   end,
      --   desc = "files staged in git",
      -- },
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
  -- {
  --   "sindrets/diffview.nvim",
  --   enabled = true,
  --   opts = {
  --     enhanced_diff_hl = true,
  --     show_help_hints = false,
  --     view = {
  --       -- Configure the layout and behavior of different types of views.
  --       -- Available layouts:
  --       --  'diff1_plain'
  --       --    |'diff2_horizontal'
  --       --    |'diff2_vertical'
  --       --    |'diff3_horizontal'
  --       --    |'diff3_vertical'
  --       --    |'diff3_mixed'
  --       --    |'diff4_mixed'
  --       -- For more info, see |diffview-config-view.x.layout|.
  --       default = {
  --         -- Config for changed files, and staged files in diff views.
  --         layout = "diff2_horizontal",
  --         winbar_info = false, -- See |diffview-config-view.x.winbar_info|
  --       },
  --       merge_tool = {
  --         -- Config for conflicted files in diff views during a merge or rebase.
  --         layout = "diff3_horizontal",
  --         disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
  --         winbar_info = true, -- See |diffview-config-view.x.winbar_info|
  --       },
  --       file_history = {
  --         -- Config for changed files in file history views.
  --         layout = "diff2_horizontal",
  --         winbar_info = false, -- See |diffview-config-view.x.winbar_info|
  --       },
  --     },
  --     file_panel = {
  --       listing_style = "tree", -- One of 'list' or 'tree'
  --       tree_options = { -- Only applies when listing_style is 'tree'
  --         flatten_dirs = true, -- Flatten dirs that only contain one single dir
  --         folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
  --       },
  --       win_config = { -- See |diffview-config-win_config|
  --         position = "left",
  --         width = 35,
  --         win_opts = {},
  --       },
  --     },
  --     file_history_panel = {
  --       log_options = { -- See |diffview-config-log_options|
  --         git = {
  --           single_file = {
  --             diff_merges = "combined",
  --           },
  --           multi_file = {
  --             diff_merges = "first-parent",
  --           },
  --         },
  --         hg = {
  --           single_file = {},
  --           multi_file = {},
  --         },
  --       },
  --       win_config = { -- See |diffview-config-win_config|
  --         position = "bottom",
  --         height = 16,
  --         win_opts = {},
  --       },
  --     },
  --     commit_log_panel = {
  --       win_config = {}, -- See |diffview-config-win_config|
  --     },
  --     default_args = { -- Default args prepended to the arg-list for the listed commands
  --       DiffviewOpen = {},
  --       DiffviewFileHistory = {},
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>D",
  --       function()
  --         local cursor_pos = vim.fn.getpos(".")
  --         if Diffviewopen == false then
  --           vim.cmd("DiffviewFileHistory")
  --           vim.cmd("DiffviewToggleFiles")
  --           Diffviewopen = true
  --         else
  --           vim.cmd("DiffviewClose")
  --           Diffviewopen = false
  --         end
  --         vim.fn.setpos(".", cursor_pos)
  --       end,
  --       desc = "code actions",
  --       mode = "n",
  --     },
  --     -- {
  --     --   "<leader>d",
  --     --   function()
  --     --     if Diffviewopen == false then
  --     --       if
  --     --         vim.api.nvim_get_mode().mode == "v"
  --     --         or vim.api.nvim_get_mode().mode == "V"
  --     --       then
  --     --         local start_row
  --     --         local end_row
  --     --         _, start_row, _, _ = unpack(vim.fn.getpos("'<"))
  --     --         _, end_row, _, _ = unpack(vim.fn.getpos("'>"))
  --     --         local cmd = "DiffviewFileHistory -L"
  --     --           .. start_row
  --     --           .. ","
  --     --           .. end_row
  --     --           .. ":"
  --     --           .. vim.api.nvim_buf_get_name(0)
  --     --         vim.cmd(cmd)
  --     --       else
  --     --         vim.cmd("DiffviewFileHistory")
  --     --       end
  --     --       Diffviewopen = true
  --     --     else
  --     --       vim.cmd("DiffviewClose")
  --     --       Diffviewopen = false
  --     --     end
  --     --   end,
  --     --   desc = "code actions",
  --     --   mode = { "v", "n" },
  --     -- },
  --   },
  -- },
}
