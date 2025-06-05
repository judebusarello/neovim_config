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
  {
    "tpope/vim-fugitive",
    enabled = true,
    config = function()
      -- Function to blame the current line and open the corresponding commit in git fugitive
      local function gblameline()
        local lineno = vim.api.nvim_win_get_cursor(0)[1] -- Get the current line number
        local filename = vim.api.nvim_buf_get_name(0)    -- Get the current buffer's file name

        -- Execute git blame for the current line
        local output = vim.fn.system({
          "git", "blame", "-L", lineno .. "," .. lineno, filename
        })

        if vim.v.shell_error ~= 0 then
          vim.notify("Shell error: " .. vim.fn.trim(output), vim.log.levels.ERROR)
          return
        end

        -- Extract the commit hash from the git blame output
        local blame_hash = string.match(vim.fn.trim(output), "^%S+")
        if blame_hash and blame_hash ~= "" then
          -- Open the commit in git fugitive
          vim.cmd("Gedit " .. blame_hash)
        else
          vim.notify("Unable to extract commit hash from git blame output", vim.log.levels.ERROR)
        end
      end

      -- Keymap to blame the current line and open it in git fugitive
      vim.keymap.set(
        "n",
        "<leader>GL",
        gblameline,
        { desc = "Blame current line and open in git fugitive" }
      )
      local function gbrowseline()
        local lineno = vim.api.nvim_win_get_cursor(0)[1] -- Get the current line number
        local filename = vim.api.nvim_buf_get_name(0)    -- Get the current buffer's file name

        -- Execute git blame for the current line
        local output = vim.fn.system({
          "git", "blame", "-L", lineno .. "," .. lineno, filename
        })

        if vim.v.shell_error ~= 0 then
          vim.notify("Shell error: " .. vim.fn.trim(output), vim.log.levels.ERROR)
          return
        end

        -- Extract the commit hash from the git blame output
        local blame_hash = string.match(vim.fn.trim(output), "^%S+")
        if blame_hash and blame_hash ~= "" then
          -- Execute GBrowse with the commit hash
          vim.cmd("GBrowse " .. blame_hash)
        else
          vim.notify("Unable to extract commit hash from git blame output", vim.log.levels.ERROR)
        end
      end

      -- Keymap to blame the current line and open it in Gbrowse
      vim.keymap.set(
        "n",
        "c",
        gbrowseline,
        { desc = "Blame current line and open in Gbrowse" }
      )
    end
  },
  { "junegunn/fzf",                            build = "./install --bin" }, -- Fuzzy finder for files, buffers, etc.
  { "neovim/nvim-lspconfig",                   enabled = true },            -- Quickstart configurations for the Nvim LSP client
  { "hrsh7th/cmp-nvim-lsp",                    enabled = true },            -- Completion source for nvim-icmp based on LSP
  { "Bekaboo/deadcolumn.nvim",                 enabled = true },            -- Show colorcolumn as you approach
  { "echasnovski/mini.comment",                enabled = true },            -- Comment out visual selection
  { "hrsh7th/vim-vsnip",                       enabled = true },            -- Snippet plugin for Vim
  { "hrsh7th/cmp-vsnip",                       enabled = true },            -- Vsnip completion source for nvim-cmp
  { "nvim-lua/plenary.nvim",                   enabled = true },            -- Lua utility functions for Neovim
  { "L3MON4D3/LuaSnip",                        enabled = false },           -- Snippet engine for Neovim written in Lua
  { "HiPhish/nvim-ts-rainbow2",                enabled = false },           -- Colorize parens and brackets
  { "lukas-reineke/indent-blankline.nvim",     enabled = false },           -- Adds indentation guides to all lines
  { "folke/trouble.nvim",                      enabled = false },           -- A pretty list for showing diagnostics, references, etc.
  { "folke/lazy.nvim",                         enabled = true },            -- A pretty list for showing diagnostics, references, etc.
  { "folke/lazydev.nvim",                      enabled = true },            -- A pretty list for showing diagnostics, references, etc.
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
    "folke/snacks.nvim",
    enabled = true,
    opts = {
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      words = { enabled = false },
    },
  }, -- A pretty list for showing diagnostics, references, etc.
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
        "E",
        function()
          vim.ui.input({ prompt = "Ask A Question" }, function(msg)
            local butterfish = require("butterfish")
            butterfish.question(vim.fn.line("'<"), vim.fn.line("'>"), msg)
          end)
        end,
        mode = { "v" },
        desc = "Butterfish Question",
      },
      {
        "R",
        function()
          vim.ui.input({ prompt = "Describe The Rewrite" }, function(msg)
            local butterfish = require("butterfish")
            butterfish.rewrite(vim.fn.line("'<"), vim.fn.line("'>"), msg)
          end)
        end,
        mode = { "v" },
        desc = "Butterfish Rewrite",
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
      butterfish.lm_base_path = "https://api.openai.com/v1"
      butterfish.lm_fast_model = "gpt-4o-2024-11-20"
      butterfish.lm_smart_model = "gpt-4o-2024-11-20"
      butterfish.active_color_group = "User1"
      butterfish.active_color_cterm = "8"
      butterfish.active_color_gui = "#808080"
    end,
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    config = function()
      require("advanced_git_search.fzf").setup({
        {
          -- fugitive or diffview
          diff_plugin = "diffview",
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
        previewers = {
          builtin = {
            -- fzf-lua is very fast, but it really struggled to preview a couple files
            -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
            -- It turns out it was Treesitter having trouble parsing the files.
            -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
            -- (Yes, I know you shouldn't have 100KB minified files in source control.)
            syntax_limit_b = 1024 * 100, -- 100KB
          },
        },
        -- grep = {
        --   -- One thing I missed from Telescope was the ability to live_grep and the
        --   -- run a filter on the filenames.
        --   -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
        --   -- With this change, I can sort of get the same behaviour in live_grep.
        --   -- ex: > enable --*/plugins/*
        --   -- I still find this a bit cumbersome. There's probably a better way of doing this.
        --   rg_glob = true, -- enable glob parsing
        --   glob_flag = "--iglob", -- case insensitive globs
        --   glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
        -- },
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
        "f",
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
      -- {
      --   "<leader>F",
      --   function()
      --     require("fzf-lua").lsp_code_actions({ multiprocess = true })
      --   end,
      --   mode = "n",
      -- },
      {
        "<leader>o",
        function()
          require("fzf-lua").oldfiles({
            include_current_session = true,
            multiprocess = true,
          })
        end,
        mode = "n",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").grep({
            search = "",
            fzf_opts = { ["--nth"] = "2.." },
          })
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
      -- Scratch terminals
      {
        "<leader>j",
        function()
          require("toggleterm").toggle(1, 0, vim.loop.cwd(), "float")
        end,
        desc = "Open scratch terminal 1",
        mode = "n",
      },
      {
        "<leader>k",
        function()
          require("toggleterm").toggle(2, 0, vim.loop.cwd(), "float")
        end,
        desc = "Open scratch terminal 2",
        mode = "n",
      },
      {
        "<leader>l",
        function()
          require("toggleterm").toggle(3, 0, vim.loop.cwd(), "float")
        end,
        desc = "Open scratch terminal 3",
        mode = "n",
      },

      -- Spotify CLI
      {
        "<leader>m",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({ id = 999999999, cmd = "spotify_player" }):toggle()
        end,
        desc = "Open Spotify CLI",
        mode = "n",
      },

      -- Close all terminals
      {
        "<S-enter>",
        function()
          for _, term in pairs(require("toggleterm.terminal").get_all()) do
            term:close()
          end
        end,
        desc = "Close all terminals",
        mode = "n",
      },
      {
        "<S-esc>",
        function()
          for _, term in pairs(require("toggleterm.terminal").get_all()) do
            term:close()
          end
        end,
        desc = "Close all terminals (terminal mode)",
        mode = "t",
      },

      -- Lazygit
      {
        "<leader>G",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({ id = 999999998, cmd = "lazygit", direction = "float" })
              :toggle()
        end,
        desc = "Open Lazygit",
        mode = "n",
      },

      -- Lazydocker
      {
        "<leader>D",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal
              :new({ id = 999999997, cmd = "lazydocker", direction = "float" })
              :toggle()
        end,
        desc = "Open Lazydocker",
        mode = "n",
      },

      -- GitHub Dashboard
      {
        "<leader>g",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({ id = 999999996, cmd = "gh dash", direction = "float" })
              :toggle()
        end,
        desc = "Open GitHub Dashboard",
        mode = "n",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" }
    },
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
            -- Comes from vsnip
            vim.fn["vsnip#anonymous"](args.body)
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
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }),
      })
    end,
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local tools = {
        "prettier",
        "buildifier",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "python-lsp-server",
        "vtsls",
        "isort",
      }

      -- Add each tool to the ensure_installed list
      for _, tool in ipairs(tools) do
        table.insert(opts.ensure_installed, tool)
      end
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
        metals = {
          settings = {
            metals = {
              superMethodLensesEnabled = true,
              showImplicitArguments = true,
              excludedPackages = {
                "akka.actor.typed.javadsl",
                "com.github.swagger.akka.javadsl",
              },
            },
          },
          init_options = {
            statusBarProvider = "on",
            isHttpEnabled = true,
          },
          on_attach = function(client, bufnr)
            -- Custom on_attach logic for Metals if needed
          end,
        },
        gopls = {
          on_new_config = function(config, new_root_dir)
            -- #!/usr/bin/env bash
            -- exec bazel run -- @io_bazel_rules_go//go/tools/gopackagesdriver "${@}" 2>> "$HOME/.local/state/nvim/lsp.log" | tee "$HOME/.local/state/nvim/gopackagesdriver_stdout.log"
            local gopackagesdriver =
            "/Users/jude/vistar/tools/gopackagesdriver.sh"
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
        view = "tabs",
      },
    },
    keys = {
      {
        "x",
        ":bp|bd #<CR>",
        mode = { "n", "v" },
        desc = "Delete Buffer",
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
  {
    "daliusd/ghlite.nvim",
    config = function()
      require("ghlite").setup({
        debug = false,           -- if set to true debugging information is written to ~/.ghlite.log file
        view_split = "vsplit",   -- set to empty string '' to open in active buffer
        diff_split = "vsplit",   -- set to empty string '' to open in active buffer
        comment_split = "split", -- set to empty string '' to open in active buffer
        open_command = "open",   -- open command to use, e.g. on Linux you might want to use xdg-open
        keymaps = {              -- override default keymaps with the ones you prefer
          diff = {
            open_file = "gf",
            open_file_tab = "gt",
            open_file_split = "gs",
            open_file_vsplit = "gv",
            approve = "<C-A>",
          },
          comment = {
            send_comment = "<C-CR>",
          },
          pr = {
            approve = "<C-A>",
          },
        },
      })
    end,
    keys = {
      { "<leader>us", ":GHLitePRSelect<cr>",        silent = true },
      { "<leader>uo", ":GHLitePRCheckout<cr>",      silent = true },
      { "<leader>uv", ":GHLitePRView<cr>",          silent = true },
      { "<leader>uu", ":GHLitePRLoadComments<cr>",  silent = true },
      { "<leader>up", ":GHLitePRDiff<cr>",          silent = true },
      { "<leader>ul", ":GHLitePRDiffview<cr>",      silent = true },
      { "<leader>ua", ":GHLitePRAddComment<cr>",    silent = true },
      { "<leader>uc", ":GHLitePRUpdateComment<cr>", silent = true },
      { "<leader>ud", ":GHLitePRDeleteComment<cr>", silent = true },
      { "<leader>ug", ":GHLitePROpenComment<cr>",   silent = true },
    },
  },
  {
    "saghen/blink.cmp",
    enabled = false,
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
      -- keymap = {
      --   accept = ";",
      --   select_prev = { "<S-Tab>" },
      --   select_next = { "<Tab>" },
      -- },
      -- highlight = {
      --   use_nvim_cmp_as_default = true,
      -- },
      -- nerd_font_variant = "normal",
      -- accept = {
      --   auto_brackets = {
      --     enabled = true,
      --   },
      -- },
      -- windows = {
      --   autocomplete = {
      --     draw = "minimal",
      --   },
      --   documentation = {
      --     auto_show = true,
      --   },
      -- },
      -- documentation = {
      --   auto_show = true,
      --   auto_show_delay_ms = 50,
      --   update_delay_ms = 50,
      -- },
      -- signature_help = {
      --   enabled = true,
      --   blocked_trigger_characters = {},
      --   blocked_retrigger_characters = {},
      --   -- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
      --   show_on_insert_on_trigger_character = true,
      -- },
      -- cycle = {
      --   from_bottom = false,
      --   from_top = false,
      -- },
    },
  },
  {
    "GeorgesAlkhouri/nvim-aider",
    cmd = "Aider",
    -- Example key mappings for common actions:
    keys = {
      { "<leader>a/", "<cmd>Aider toggle<cr>",       desc = "Toggle Aider" },
      {
        "<leader>as",
        "<cmd>Aider send<cr>",
        desc = "Send to Aider",
        mode = { "n", "v" },
      },
      { "<leader>ac", "<cmd>Aider command<cr>",      desc = "Aider Commands" },
      { "<leader>ab", "<cmd>Aider buffer<cr>",       desc = "Send Buffer" },
      { "<leader>a+", "<cmd>Aider add<cr>",          desc = "Add File" },
      { "<leader>a-", "<cmd>Aider drop<cr>",         desc = "Drop File" },
      { "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "Add Read-Only" },
      -- Example nvim-tree.lua integration if needed
      {
        "<leader>a+",
        "<cmd>AiderTreeAddFile<cr>",
        desc = "Add File from Tree to Aider",
        ft = "NvimTree",
      },
      {
        "<leader>a-",
        "<cmd>AiderTreeDropFile<cr>",
        desc = "Drop File from Tree from Aider",
        ft = "NvimTree",
      },
    },
    dependencies = {
      "folke/snacks.nvim",
      --- The below dependencies are optional
      "catppuccin/nvim",
      "nvim-tree/nvim-tree.lua",
      --- Neo-tree integration
      {
        "nvim-neo-tree/neo-tree.nvim",
        opts = function(_, opts)
          -- Example mapping configuration (already set by default)
          -- opts.window = {
          --   mappings = {
          --     ["+"] = { "nvim_aider_add", desc = "add to aider" },
          --     ["-"] = { "nvim_aider_drop", desc = "drop from aider" }
          --     ["="] = { "nvim_aider_add_read_only", desc = "add read-only to aider" }
          --   }
          -- }
          require("nvim_aider.neo_tree").setup(opts)
        end,
      },
    },
    config = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
    },
  },
}
