local mark_stack = {}

local function push_mark()
  local row_col = vim.api.nvim_win_get_cursor(0)
  local bufnr = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(bufnr)
  if file == "" then
    return
  end
  table.insert(mark_stack, { file = file, row = row_col[1], col = row_col[2] })
end

local function pop_mark()
  local mark = table.remove(mark_stack)
  if not mark then
    vim.notify("No marks in stack", vim.log.levels.INFO)
    return
  end

  vim.cmd.edit(vim.fn.fnameescape(mark.file))
  pcall(vim.api.nvim_win_set_cursor, 0, { mark.row, mark.col })
end

return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    keys = {
      {
        "<leader>r",
        vim.lsp.buf.rename,
        desc = "rename variable under cursor",
        mode = "n",
      },
      {
        "m",
        function()
          push_mark()
          vim.lsp.buf.definition()
        end,
        desc = "jump to definition",
        mode = "n",
      },
      {
        "M",
        function()
          pop_mark()
        end,
        desc = "pop mark (jump back)",
        mode = "n",
      },
    },
    config = function()
      -- Server setup lives in `mason_lspconfig.lua` so this plugin spec can stay
      -- focused on keymaps and any per-plugin tweaks.
    end,
  },
}
