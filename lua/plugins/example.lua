vim.opt.fillchars:append({ diff = "╱" })
vim.opt.diffopt:append("filler")
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")
vim.opt.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.smartindent = false

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
  { "tpope/vim-fugitive",                      enabled = true },            -- Git integration for Vim
  { "junegunn/fzf",                            build = "./install --bin" }, -- Fuzzy finder for files, buffers, etc.
  { "neovim/nvim-lspconfig",                   enabled = true },            -- Quickstart configurations for the Nvim LSP client
  { "hrsh7th/cmp-nvim-lsp",                    enabled = true },            -- Completion source for nvim-cmp based on LSP
  { "Bekaboo/deadcolumn.nvim",                 enabled = true },            -- Show colorcolumn as you approach
  { "echasnovski/mini.comment",                enabled = true },            -- Comment out visual selection
  { "hrsh7th/vim-vsnip",                       enabled = true },            -- Snippet plugin for Vim
  { "hrsh7th/cmp-vsnip",                       enabled = true },            -- Vsnip completion source for nvim-cmp
  { "nvim-lua/plenary.nvim",                   enabled = true },            -- Lua utility functions for Neovim
  { "L3MON4D3/LuaSnip",                        enabled = false },           -- Snippet engine for Neovim written in Lua
  { "HiPhish/nvim-ts-rainbow2",                enabled = false },           -- Colorize parens and brackets
  { "lukas-reineke/indent-blankline.nvim",     enabled = false },           -- Adds indentation guides to all lines
  { "folke/trouble.nvim",                      enabled = false },           -- A pretty list for showing diagnostics, references, etc.
  { "folke/todo-comments.nvim",                enabled = false },           -- Highlight and list TODO comments
  { "zbirenbaum/copilot-cmp",                  enabled = false },           -- Copilot integration with nvim-cmp
  { "zbirenbaum/copilot.lua",                  enabled = false },           -- Copilot integration for Neovim
  { "MunifTanjim/nui.nvim",                    enabled = false },           -- UI component library for Neovim
  { "folke/noice.nvim",                        enabled = false },           -- Enhance the default Neovim UI
  { "echasnovski/mini.ai",                     enabled = false },           -- Text objects for common programming patterns
  { "nvimdev/dashboard-nvim",                  enabled = false },           -- A fancy start screen for Neovim
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },           -- Show code context using treesitter
  { "nvim-pack/nvim-spectre.nvim",             enabled = false },           -- Find and replace tool for Neovim
  { "folke/zen-mode.nvim",                     enabled = false },           -- Distraction-free coding for Neovim
  { "windwp/nvim-ts-autotag",                  enabled = false },           -- Auto close and rename HTML tags
  { "folke/flash.nvim",                        enabled = false },           -- Flash plugin for Neovim
  { "kdheepak/lazygit.nvim",                   enabled = false },           -- Lazygit integration for Neovim
  { "goolord/alpha-nvim",                      enabled = false },           -- A fast and customizable start screen for Neovim
  { "echasnovski/mini.pairs",                  enabled = false },           -- Autocompletion for paired characters like brackets
  { "nvim-neo-tree/neo-tree.nvim",             enabled = false },           -- File explorer tree for Neovim
  { "folke/neodev.nvim",                       enabled = false },           -- Development setup for Neovim plugins
  { "mfussenegger/nvim-lint",                  enabled = false },           -- Asynchronous linter for Neovim
  { "stevearc/conform.nvim",                   enabled = false },           -- Code formatter for Neovim
  { "nvim-lualine/lualine.nvim",               enabled = false },           -- Statusline plugin for Neovim
  { "echasnovski/mini.indentscope",            enabled = false },           -- Animated scope lines for indentation
  { "SmiteshP/nvim-navic",                     enabled = false },           -- Code navigation component for the statusline
  { "RRethy/vim-illuminate",                   enabled = false },           -- Highlight other uses of the word under the cursor
  { "hrsh7th/cmp-buffer",                      enabled = false },           -- Buffer words completion source for nvim-cmp
  { "hrsh7th/cmp-path",                        enabled = false },           -- Filesystem paths completion source for nvim-cmp
  { "ggandor/leap.nvim",                       enabled = false },           -- Motion plugin for Neovim
  { "rmagatti/auto-session",                   enabled = false },           -- Session management for Neovim
  { "windwp/nvim-autopairs",                   enabled = false },           -- Autocompletion for paired characters
  { "nvim-telescope/telescope.nvim",           enabled = false },           -- FZF-like searcher
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
      {
        "Q",
        ":BFQuestion ",
        mode = { "v" },
        desc = "Butterfish Question",
      },
      {
        "R",
        ":BFRewrite ",
        mode = { "v" },
        desc = "Butterfish Rewrite",
      },
      {
        "E",
        ":BFComment<CR>",
        mode = { "v" },
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
      require("triptych").setup({})
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
    },
  },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = true }, -- Additional textobjects for treesitter
  {
    "nvim-treesitter",
    enabled = true,
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<TAB>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
      indent = true,
      rainbow = {
        enable = true,
      },
    },
  },
  {
    "chrisgrieser/nvim-chainsaw",
    enabled = true,
    opts = {
      marker = "Jude>>>> ",
      logStatements = {
        messageLog = {
          javascript = {
            "/* prettier-ignore */ // %s",
            'console.log("%s %s:", %s);',
          },
          typescript = {
            "/* prettier-ignore */ // %s",
            'console.log("%s %s:", %s);',
          },
          go = 'fmt.Print("%s")',
          python = 'print("%s")',
        },
      },
    },
    keys = {
      {
        "<leader>p",
        function()
          require("chainsaw").objectLog()
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
      vim.keymap.del("t", "<esc><esc>")
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
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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
              { name = "spell" },
            }),
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
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
  { "williamboman/mason-lspconfig.nvim",           enabled = true },
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
  { "stevearc/dressing.nvim", enabled = true }, --this makes the rename dialog appear right over the thing you're renaming instead of the command line
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
