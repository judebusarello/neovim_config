return {
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
      {
        "<C-Tab>",
        ":BufferLineCycleNext<CR>",
        mode = "n",
        desc = "Move to Next Tab",
      },
    },
  },
}
