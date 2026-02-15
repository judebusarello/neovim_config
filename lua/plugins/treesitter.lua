return {
  {
    "nvim-treesitter/nvim-treesitter",
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
}
