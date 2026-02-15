return {
  {
    "chrisgrieser/nvim-chainsaw",
    enabled = true,
    opts = {
      marker = "Jude>>>> ",
      logStatements = {
        messageLog = {
          javascript = {
            "/* prettier-ignore */ // %s",
            'console.log("%s %s:", %s);',
          },
          typescript = {
            "/* prettier-ignore */ // %s",
            'console.log("%s %s:", %s);',
          },
          go = 'fmt.Print("%s")',
          python = 'print("%s")',
        },
      },
    },
    keys = {
      {
        "<leader>p",
        function()
          require("chainsaw").objectLog()
        end,
        desc = "open scratch terminal",
        mode = "n",
      },
    },
  },
}
