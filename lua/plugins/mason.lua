return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local tools = {
        "prettier",
        "buildifier",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "python-lsp-server",
        "vtsls",
        "isort",
      }

      -- Add each tool to the ensure_installed list
      for _, tool in ipairs(tools) do
        table.insert(opts.ensure_installed, tool)
      end
    end,
  },
}
