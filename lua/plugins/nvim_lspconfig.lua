local mark_stacks = {}
local definition_buffers = {}

local function cleanup_definition_buffer(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    definition_buffers[buf] = nil
    return
  end
  if not definition_buffers[buf] or vim.bo[buf].modified then
    return
  end
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == buf then
      return
    end
  end
  for win, stack in pairs(mark_stacks) do
    if vim.api.nvim_win_is_valid(win) then
      for _, mark in ipairs(stack) do
        if mark.buf == buf then
          return
        end
      end
    end
  end
  vim.api.nvim_buf_delete(buf, {})
  definition_buffers[buf] = nil
end

local function jump_to_definition()
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(win)
  local view = vim.fn.winsaveview()
  local existing_buffers = {}
  for _, existing in ipairs(vim.api.nvim_list_bufs()) do
    existing_buffers[existing] = true
  end

  local function jump(item)
    if not item or not vim.api.nvim_win_is_valid(win)
      or vim.api.nvim_get_current_win() ~= win
      or vim.api.nvim_win_get_buf(win) ~= buf
      or not vim.deep_equal(vim.api.nvim_win_get_cursor(win), cursor) then
      return
    end
    local target = item.bufnr or vim.fn.bufadd(item.filename)
    if target == buf and item.lnum == cursor[1] and item.col - 1 == cursor[2] then
      return
    end

    local bufhidden = vim.bo[buf].bufhidden
    if bufhidden == "wipe" then
      vim.bo[buf].bufhidden = "hide"
    end
    local ok, err = pcall(vim.api.nvim_win_set_buf, win, target)
    if not ok then
      vim.bo[buf].bufhidden = bufhidden
      vim.notify(tostring(err), vim.log.levels.ERROR)
      return
    end
    mark_stacks[win] = mark_stacks[win] or {}
    table.insert(mark_stacks[win], { buf = buf, view = view })
    if not existing_buffers[target] then
      definition_buffers[target] = true
    end
    vim.bo[target].buflisted = true
    vim.api.nvim_win_set_cursor(win, { math.min(item.lnum, vim.api.nvim_buf_line_count(target)), item.col - 1 })
    vim.cmd("normal! zv")
  end

  vim.lsp.buf.definition({
    on_list = function(options)
      if #options.items == 1 then
        jump(options.items[1])
      else
        vim.ui.select(options.items, {
          prompt = "Select definition:",
          format_item = function(item)
            return string.format("%s:%d:%d", item.filename, item.lnum, item.col)
          end,
        }, jump)
      end
    end,
  })
end

local function pop_mark()
  local stack = mark_stacks[vim.api.nvim_get_current_win()]
  if not stack or #stack == 0 then
    vim.notify("No marks in stack", vim.log.levels.INFO)
    return
  end
  local mark = stack[#stack]
  if not vim.api.nvim_buf_is_valid(mark.buf) then
    table.remove(stack)
    vim.notify("Previous definition buffer was deleted", vim.log.levels.WARN)
    return
  end

  local leaving = vim.api.nvim_get_current_buf()
  vim.api.nvim_win_set_buf(0, mark.buf)
  vim.fn.winrestview(mark.view)
  table.remove(stack)
  cleanup_definition_buffer(leaving)
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
        jump_to_definition,
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
