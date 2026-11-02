return {
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
      local config = require("metals").bare_config()
      config.capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Include Bazel/BSP markers alongside Metals' standard project markers.
      config.root_patterns = {
        ".bsp",
        "MODULE.bazel",
        "WORKSPACE.bazel",
        "WORKSPACE",
        "build.sbt",
        "build.sc",
        "build.mill",
        "settings.gradle",
        "pom.xml",
        ".scala-build",
        "bleep.yaml",
        ".git",
      }
      return config
    end,
    config = function(plugin, config)
      local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = plugin.ft,
        callback = function()
          require("metals").initialize_or_attach(config)
        end,
      })
    end,
  },
}
