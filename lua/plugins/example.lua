vim.opt.fillchars:append({ diff = "╱" })
vim.opt.diffopt:append("filler")
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")
vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- https://github.com/rhysd/committia.vim promising?
-- tyru/columnskip.vim  promising?
--https://github.com/kevinhwang91/nvim-bqf
--:set foldmethod=expr
--foldexpr=nvim_treesitter#foldexpr()
--
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  { "tpope/vim-fugitive",                          enabled = true }, -- colorize parens and brackets
  { "junegunn/fzf",                                build = "./install --bin" },
  { "neovim/nvim-lspconfig",                       enabled = true },
  { "hrsh7th/cmp-nvim-lsp",                        enabled = true },
  { "HiPhish/nvim-ts-rainbow2",                    enabled = false }, -- colorize parens and brackets
  { "Bekaboo/deadcolumn.nvim",                     enabled = true },  -- show colorcolumn as you approach
  { "lukas-reineke/indent-blankline.nvim",         enabled = false }, -- gives the context on the cursor's current scope
  { "echasnovski/mini.comment",                    enabled = true },  --comment out visual selection
  { "hrsh7th/vim-vsnip",                           enabled = true },  -- Needed for completion
  { "hrsh7th/cmp-vsnip",                           enabled = true },  -- Needed for completion
  { "L3MON4D3/LuaSnip",                            enabled = false }, -- Dunno what I'm doing with this
  { "folke/trouble.nvim",                          enabled = false },
  { "folke/todo-comments.nvim",                    enabled = false },
  { "zbirenbaum/copilot-cmp",                      enabled = false },
  { "zbirenbaum/copilot.lua",                      enabled = false },
  { "MunifTanjim/nui.nvim",                        enabled = false },
  { "folke/noice.nvim",                            enabled = false },
  { "echasnovski/mini.ai",                         enabled = false }, --don't know how to use
  { "nvimdev/dashboard-nvim",                      enabled = false }, --don't know how to use
  { "nvim-treesitter/nvim-treesitter-context",     enabled = false }, --don't know how to use
  { "nvim-pack/nvim-spectre.nvim",                 enabled = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = false }, --don't know how to use
  { "folke/zen-mode.nvim",                         enabled = false },
  { "windwp/nvim-ts-autotag",                      enabled = false },
  { "folke/flash.nvim",                            enabled = false },
  { "kdheepak/lazygit.nvim",                       enabled = false },
  { "goolord/alpha-nvim",                          enabled = false }, -- Welcome screen
  { "echasnovski/mini.pairs",                      enabled = false }, -- This autotypes paired bracus
  { "echasnovski/mini.pairs",                      enabled = false }, -- This autotypes paired bracus
  { "nvim-neo-tree/neo-tree.nvim",                 enabled = false }, -- I prefer the telescope extension for this stuff
  { "folke/neodev.nvim",                           enabled = false },
  { "mfussenegger/nvim-lint",                      enabled = false },
  { "stevearc/conform.nvim",                       enabled = false },
  { "nvim-lualine/lualine.nvim",                   enabled = false }, -- don't like statuslines
  { "echasnovski/mini.indentscope",                enabled = false }, -- the animated scope lines were distracting
  { "SmiteshP/nvim-navic",                         enabled = false }, -- This shows data in the statusbar that I don't have
  { "folke/trouble.nvim",                          enabled = false }, -- this is a list of all the diagnostic errors etc. Don't use it
  { "RRethy/vim-illuminate",                       enabled = false }, -- underlines all the same words as under the cursor. I find this distracting.
  { "hrsh7th/cmp-buffer",                          enabled = false }, -- I don't want autocomplete to come from random words in the buffer
  { "hrsh7th/cmp-path",                            enabled = false }, -- I don't use filesystem paths frequently. More likely to mess me up than help me out.
  { "ggandor/leap.nvim",                           enabled = false }, -- I don't use easymotions
  { "rmagatti/auto-session",                       enabled = false }, -- I don't use easymotions
  { "windwp/nvim-autopairs",                       enabled = false }, -- This seems like I can make this work how I want
  { "nvim-lua/plenary.nvim",                       enabled = true },
  { "nvim-telescope/telescope.nvim",               enabled = false },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    enabled = true,
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "bakks/butterfish.nvim",
    enabled = true,
    dependencies = { "tpope/vim-commentary" },
    keys = {
      -- { "<leader>ap", ":BFFilePrompt ",   desc = "Butterfish File Prompt" },
      -- { "<leader>ar", ":BFRewrite ",      mode = { "n", "v" },            desc = "Butterfish Rewrite" },
      {
        "E",
        ":BFComment<CR>",
        mode = { "n", "v" },
        desc = "Butterfish Comment",
      },
      -- { "<leader>ae", ":BFExplain<CR>",   mode = { "n" },                 desc = "Butterfish Explain" },
      -- { "<leader>ae", ":BFExplain<CR>",   mode = { "v" },                 desc = "Butterfish Explain" },
      -- { "<leader>af", ":BFFix<CR>",       desc = "Butterfish Fix" },
      -- { "<leader>ai", ":BFImplement<CR>", desc = "Butterfish Implement" },
      -- { "<leader>ad", ":BFEdit ",         desc = "Butterfish Edit" },
      -- { "<leader>aq", ":BFQuestion ", desc = "Butterfish Question" },
    },
    config = function()
      local butterfish = require("butterfish")
      -- butterfish.lm_base_path = "http://localhost:1234/v1"
      -- butterfish.lm_fast_model = "ZeroWw/microsoft_WizardLM-2-7B-GGUF"
      -- butterfish.lm_smart_model = "ZeroWw/microsoft_WizardLM-2-7B-GGUF"
      butterfish.active_color_group = "User1"
      butterfish.active_color_cterm = "8"
      butterfish.active_color_gui = "#808080"
    end,
  },
  {
    "pwntester/octo.nvim",
    enabled = true,
    lazy = false,
    config = function()
      require("octo").setup({
        picker = "fzf-lua",
        enable_builtin = true,
        use_local_fs = true,
        comment_icon = "💬",
        snippet_context_lines = 10,
        mappings = {
          review_diff = {
            next_thread = { lhs = "t", desc = "move to next thread" },
            prev_thread = { lhs = "T", desc = "move to previous thread" },
            add_review_comment = {
              lhs = "c",
              desc = "add a new review comment",
            },
            select_next_entry = {
              lhs = ">",
              desc = "move to previous changed file",
            },
            select_prev_entry = {
              lhs = "<",
              desc = "move to next changed file",
            },
            close_review_tab = { lhs = "<leader>x", desc = "close review tab" },
          },
          review_thread = {
            add_comment = { lhs = "c", desc = "add comment" },
            add_suggestion = { lhs = "C", desc = "add suggestions" },
            delete_comment = { lhs = "d", desc = "delete comment" },
            next_comment = { lhs = "t", desc = "go to next comment" },
            prev_comment = { lhs = "T", desc = "go to previous comment" },
            select_next_entry = {
              lhs = "n",
              desc = "move to previous changed file",
            },
            select_prev_entry = {
              lhs = "N",
              desc = "move to next changed file",
            },
            close_review_tab = { lhs = "x", desc = "close review tab" },
          },
          submit_win = {
            approve_review = { lhs = "P", desc = "approve review" },
            comment_review = { lhs = "p", desc = "comment review" },
            request_changes = { lhs = "pp", desc = "request changes review" },
            close_review_tab = { lhs = "x", desc = "close review tab" },
          },
          pull_request = {
            squash_and_merge_pr = {
              lhs = "<space>psm",
              desc = "squash and merge PR",
            },
            list_changed_files = {
              lhs = "<space>pf",
              desc = "list PR changed files",
            },
            show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
            add_reviewer = { lhs = "r", desc = "add reviewer" },
            add_comment = { lhs = "c", desc = "add comment" },
            delete_comment = { lhs = "d", desc = "delete comment" },
          },
        },
        picker_config = {
          use_emojis = true, -- only used by "fzf-lua" picker for now
          mappings = {       -- mappings for the pickers
            open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
            merge_pr = { lhs = "<C-r>", desc = "merge pull request" },
          },
        },
        file_panel = {
          size = 5,         -- changed files panel rows
          use_icons = true, -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
        },
      })
      vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
      vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
    end,
  },

  {
    "aaronhallaert/advanced-git-search.nvim",
    config = function()
      require("advanced_git_search.fzf").setup({
        {
          -- fugitive or diffview
          diff_plugin = "fugitive",
          -- customize git in previewer
          -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
          git_flags = {},
          -- customize git diff in previewer
          -- e.g. flags such as { "--raw" }
          git_diff_flags = {},
          -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
          show_builtin_git_pickers = false,
          entry_default_author_or_date = "author", -- one of "author" or "date"
        },
      })
    end,
    dependencies = {
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  },

  -- { "jose-elias-alvarez/null-ls.nvim",     enabled = false },
  -- { "elentok/format-on-save.nvim" },
  -- {
  --   "nvimdev/guard.nvim",
  --   enabled = true,
  --   config = function()
  --     local ft = require("guard.filetype")
  --     ft("python"):fmt({
  --       cmd = "/home/jude/vistar/ci/fmt-python",
  --       args = { "fix" },
  --       fname = false,
  --       stdin = false,
  --     })
  --     require("guard").setup({})
  --   end,
  --   opts = {
  --     fmt_on_save = false,
  --     lsp_as_default_formatter = false,
  --   },
  -- },
  --
  {
    "simonmclean/triptych.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("triptych").setup({
        mappings = {
          show_help = "g?",
          nav_left = "h",
          nav_right = { "l", "<CR>" },
          delete = "d",
          add = "a",
          copy = "c",
          rename = "r",
          cut = "x",
          paste = "p",
          quit = "q",
          toggle_hidden = ".",
        },
        extension_mappings = {},
        options = {
          dirs_first = true,
          show_hidden = true,
          line_numbers = {
            enabled = true,
            relative = false,
          },
          file_icons = {
            enabled = true,
            directory_icon = "",
            fallback_file_icon = "",
          },
          column_widths = { 0.25, 0.25, 0.5 }, -- Must add up to 1 after rounding to 2 decimal places
          highlights = {                       -- Highlight groups to use. See `:highlight` or `:h highlight`
            file_names = "NONE",
            directory_names = "NONE",
          },
          syntax_highlighting = {
            enabled = true,
            debounce_ms = 100,
          },
        },
        git_signs = {
          enabled = true,
        },
        diagnostic_signs = {
          enabled = false,
        },
      })
    end,
    keys = {
      {
        "<leader>t",
        function()
          require("triptych").toggle_triptych()
        end,
        mode = "n",
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        "max-perf",
        winopts = {
          -- border = "FloatBorder",
          width = 0.9,
          height = 0.9,
          preview = {
            -- hidden = "hidden",
            border = "noborder",
            wrap = "wrap",
            scrollbar = true,
            layout = "horizontal",
            title = true,
            number = false,
            horizontal = "right:60%",
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
        "<leader>F",
        function()
          require("fzf-lua").lsp_code_actions({ multiprocess = true })
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
    lsp = {
      async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
      git_icons = true,
      code_actions = {
        prompt = "Code Actions> ",
        async_or_timeout = 5000000,
        -- when git-delta is installed use "codeaction_native" for beautiful diffs
        -- try it out with `:FzfLua lsp_code_actions previewer=codeaction_native`
        -- scroll up to `previewers.codeaction{_native}` for more previewer options
        previewer = "codeaction",
      },
      finder = {
        --        prompt      = "LSP Finder> ",
        --        file_icons  = true,
        --        color_icons = true,
        --        git_icons   = false,
        async = true, -- async by default
        --        silent      = true,         -- suppress "not found"
        --        separator   = "| ",         -- separator after provider prefix, `false` to disable
        --        includeDeclaration = true,  -- include current declaration in LSP context
        --        -- by default display all LSP locations
        --        -- to customize, duplicate table and delete unwanted providers
        --        providers   = {
        --            { "references",      prefix = require("fzf-lua").utils.ansi_codes.blue("ref ") },
        --            { "definitions",     prefix = require("fzf-lua").utils.ansi_codes.green("def ") },
        --            { "declarations",    prefix = require("fzf-lua").utils.ansi_codes.magenta("decl") },
        --            { "typedefs",        prefix = require("fzf-lua").utils.ansi_codes.red("tdef") },
        --            { "implementations", prefix = require("fzf-lua").utils.ansi_codes.green("impl") },
        --            { "incoming_calls",  prefix = require("fzf-lua").utils.ansi_codes.cyan("in  ") },
        --            { "outgoing_calls",  prefix = require("fzf-lua").utils.ansi_codes.yellow("out ") },
        --        },
      },
    },
  },
  -- vim.treesitter.language.register('markdown', 'octo')
  {
    "nvim-treesitter",
    enabled = true,
    -- opts = {
    --   rainbow = {
    --     enable = true,
    --   },
    -- },
  },
  -- {
  --   "folke/noice.nvim",
  --   enabled = true,
  --   opts = {
  --     messages = {
  --       enabled = true,            -- enables the Noice messages UI
  --       view = "mini",             -- default view for messages
  --       view_error = "mini",       -- view for errors
  --       view_warn = "mini",        -- view for warnings
  --       view_history = "messages", -- view for :messages
  --       view_search = false,       -- view for search count messages. Set to `false` to disable
  --     },
  --     views = {
  --       cmdline_popup = {
  --         border = {
  --           style = "none",
  --           padding = { 1, 2 },
  --         },
  --         filter_options = {},
  --         win_options = {
  --           winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "chrisgrieser/nvim-chainsaw",
    enabled = true,
    opts = {
      marker = "[TESTING]",
      logStatements = {
        messageLog = {
          javascript = 'console.log("%s");',
          go = 'fmt.Print("%s")',
        },
      },
    },
    keys = {
      {
        "<leader>p",
        function()
          require("chainsaw").messageLog()
        end,
        desc = "open scratch terminal",
        mode = "n",
      },
      {
        "<leader>P",
        function()
          require("chainsaw").variableLog()
        end,
        desc = "open scratch terminal",
        mode = "n",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      level = vim.log.levels.INFO,
      timeout = 100,
      stages = "fade",
      minimum_width = 0,
      fps = 60,
      top_down = true,
      render = function(bufnr, notif)
        local padded_message = vim.tbl_map(function(line)
          return "  " .. line .. "  "
        end, notif.message)
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, padded_message)
      end,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    enabled = true,
    config = function()
      vim.keymap.del('t', '<esc><esc>')
      require("toggleterm").setup({
        direction = "float",
        auto_scroll = false,
        start_in_insert = true,
        float_opts = {
          border = "curved",
          width = 300,
          height = 100,
        },
      })
    end,
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
          require("toggleterm").toggle(3, 0, vim.loop.cwd(), "float")
        end,
        desc = "open scratch terminal",
        mode = "n",
      },
      {
        "<leader>m",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local spotify =
              Terminal:new({ id = 999999999, cmd = "spotify_player" })
          spotify:toggle()
        end,
        desc = "open spotify cli",
        mode = "n",
      },
      {
        "<S-esc>",
        function()
          local terms = require("toggleterm.terminal")
          local terminals = terms.get_all()
          for _, term in pairs(terminals) do
            term:close()
          end
        end,
        desc = "close all terminals",
        mode = "n",
      },
      {
        "<S-esc>",
        function()
          local terms = require("toggleterm.terminal")
          local terminals = terms.get_all()
          for _, term in pairs(terminals) do
            term:close()
          end
        end,
        desc = "close all terminals",
        mode = "t",
      },
      {
        "<leader>G",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ id = 999999998, cmd = "lazygit" })
          lazygit:toggle()
        end,
        desc = "open lazygit",
        mode = "n",
      },
      {
        "<leader>D",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ id = 999999997, cmd = "lazydocker" })
          lazygit:toggle()
        end,
        desc = "open lazygit",
        mode = "n",
      },
      {
        "<leader>g",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local githubdashboard =
              Terminal:new({ id = 999999996, cmd = "gh dash" })
          githubdashboard:toggle()
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
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          [";"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior })
            else
              fallback()
            end
          end),
          ["<S-Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior })
            else
              fallback()
            end
          end),
          -- Set configuration for specific filetype.
          cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
              { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
              { name = "buffer" },
            }),
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "vsnip" },
        }, {
          { name = "spell" },
        }),
      })
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
      -- {
      --   "<leader>r",
      --   vim.lsp.buf.references,
      --   desc = "get references",
      --   mode = "n",
      -- },
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
        gopls = {
          on_new_config = function(config, new_root_dir)
            local gopackagesdriver =
            "/Users/jude/vistar/tools/gopackagesdriver.sh"
            -- ".config/nvim/lua/plugins/gopackagesdriver.sh"
            if vim.loop.fs_stat(new_root_dir) ~= nil then
              config.cmd_env = {
                GOPACKAGESDRIVER = gopackagesdriver,
                GOPACKAGESDRIVER_BAZEL_BUILD_FLAGS = "--strategy=GoStdlibList=local",
              }
            end
          end,
          settings = {
            -- hints = {
            --   assignVariableTypes = true,
            --   compositeLiteralFields = true,
            --   constantValues = true,
            --   functionTypeParameters = true,
            --   parameterNames = true,
            --   rangeVariableTypes = true,
            -- },
            gopls = {
              directoryFilters = {
                "-bazel-bin",
                "-bazel-out",
                "-bazel-testlogs",
                -- "-bazel-" .. require("utils").get_current_dir_name(),
              },
            },
          },
          -- root_dir = require("utils").root_pattern("WORKSPACE"),
          -- flags = {
          --   debounce_text_changes = 150,
          -- },
        },
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                rope_autoimport = { enabled = true },
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
        ":bp|bd #<CR>",
        mode = { "n", "v" },
        desc = "Delete Buffer",
      },
      {
        "<leader>h",
        "gt",
        mode = { "n", "v" },
        desc = "switch tab",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    keys = {
      -- {
      --   "",
      --   function()
      --     require("gitsigns").next_hunk()
      --   end,
      --   desc = "see what changed on that line based on the changes made",
      --   mode = "n",
      -- },
      -- {
      --   "",
      --   function()
      --     require("gitsigns").prev_hunk()
      --   end,
      --   desc = "see what changed on that line based on the changes made",
      --   mode = "n",
      -- },
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
        "<leader>bb",
        function()
          require("gitsigns").blame_line({
            full = true,
            ignore_whitespace = true,
          })
        end,
        desc = "show to commit message of the current line",
        mode = "n",
      },
    },
    config = function()
      require("gitsigns").setup({
        -- base = "@{u}...HEAD",
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
