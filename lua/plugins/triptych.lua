return {
  {
    "simonmclean/triptych.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("triptych").setup({
        mappings = {
          quit = "<S-esc>", -- Rebind the quit button to Shift-Escape
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
}
