return {
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
        grep = {
          rg_glob = true,
          glob_flag = "--iglob",
          glob_separator = "%s%-%-",
        },
        winopts = {
          -- border = "FloatBorder",
          width = 0.8,
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
      {
        "<leader>F",
        function()
          require("fzf-lua").fzf_exec("ls", {
            actions = {
              ["ctrl-x"] = {
                function(selected)
                  for _, f in ipairs(selected) do
                    print("deleting:", f)
                    -- uncomment to enable deletion
                    -- vim.fn.delete(f)
                  end
                end,
                require("fzf-lua").actions.resume,
              },
            },
          })
        end,
        mode = "n",
      },
      {
        "<leader>o",
        function()
          require("fzf-lua").oldfiles({
            include_current_session = true,
          })
        end,
        mode = "n",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").grep({
            search = " -- !*cortex* !*.md !*.sql !*test* !*spec* ",
            no_esc = true,
            fzf_opts = { ["--nth"] = "2.." },
          })
        end,
        mode = "n",
      },
      {
        "<leader>\\",
        function()
          require("fzf-lua").grep({
            search = " -- !*cortex* !*.md !*.sql *test* *spec* ",
            no_esc = true,
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
}
