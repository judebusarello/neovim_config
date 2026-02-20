return {
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = true,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "b0o/schemastore.nvim",
    },
    opts = {
      ensure_installed = {
        "gopls",
        "jsonls",
        "lua_ls",
        "pylsp",
        "vtsls",
      },
      -- mason-lspconfig.nvim no longer supports `automatic_installation` (removed upstream).
    },
    config = function(_, opts)
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = opts.ensure_installed or {},
        -- Disable mason-lspconfig's auto-enabler so we can enable exactly the servers we want.
        automatic_enable = false,
      })

      -- Ensure lsp server definitions (runtime `lsp/*.lua`) are on the runtimepath.
      pcall(require, "lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      vim.lsp.config("*", { capabilities = capabilities })

      local servers = {
        gopls = {
          cmd_env = {
            GOPACKAGESDRIVER = "/Users/jude/vistar/tools/gopackagesdriver.sh",
            GOPACKAGESDRIVER_BAZEL_BUILD_FLAGS = "--strategy=GoStdlibList=local",
          },
          settings = {
            gopls = {
              directoryFilters = {
                "-bazel-bin",
                "-bazel-out",
                "-bazel-testlogs",
              },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
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
      }

      for server_name, server_opts in pairs(servers) do
        vim.lsp.config(server_name, server_opts)
      end

      local enable_servers = {}
      for _, server_identifier in ipairs(opts.ensure_installed or {}) do
        table.insert(enable_servers, (server_identifier:gsub("@.*$", "")))
      end
      vim.lsp.enable(enable_servers)
    end,
  },
}
