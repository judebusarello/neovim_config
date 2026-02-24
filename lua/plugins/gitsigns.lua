return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    keys = {
      {
        "c",
        function()
          require("gitsigns").nav_hunk("next", { target = "all" })
          vim.cmd("normal! zz")
        end,
        desc = "Jump to next git hunk",
        mode = "n",
      },
      {
        "C",
        function()
          require("gitsigns").nav_hunk("prev", { target = "all" })
          vim.cmd("normal! zz")
        end,
        desc = "Jump to previous git hunk",
        mode = "n",
      },
      {
        "<leader>d",
        function()
          require("gitsigns").preview_hunk_inline()
        end,
        desc = "see what changed on that line based on the changes made",
        mode = "n",
      },
      {
        "<leader>B",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "reset the hunk to what it use to be",
        mode = "n",
      },
      {
        "<leader>b",
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
}
