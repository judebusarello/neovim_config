return {
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        diagnostics = false,
        show_close_icon = true,
        separator_style = "slant",
        always_show_bufferline = true,
      },
    },
    config = function(_, opts)
      vim.opt.showtabline = 2
      require("bufferline").setup(opts)
    end,
    keys = {
      {
        "x",
        ":bp|bd #<CR>",
        mode = { "n", "v" },
        desc = "Delete Buffer",
      },
    },
  },
}
