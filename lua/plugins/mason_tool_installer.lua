return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "buildifier",
        "prettier",
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
    },
    config = function(_, opts)
      require("mason-tool-installer").setup(opts)
    end,
  },
}
