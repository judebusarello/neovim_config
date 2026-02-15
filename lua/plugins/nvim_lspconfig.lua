return {
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
      autoformat = false,
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
            local gopackagesdriver = "/Users/jude/vistar/tools/gopackagesdriver.sh"
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
}
