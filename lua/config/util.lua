local M = {}

function M.toggle(option, _silent, values)
  if values ~= nil then
    local current = vim.o[option]
    local next_value = current == values[1] and values[2] or values[1]
    vim.o[option] = next_value
    return
  end

  vim.o[option] = not vim.o[option]
end

function M.has(name)
  local ok, config = pcall(require, "lazy.core.config")
  if not ok then
    return false
  end

  for _, plugin in pairs(config.plugins or {}) do
    if plugin.name == name then
      return true
    end
    if plugin[1] == name then
      return true
    end
  end

  return false
end

function M.get_root()
  local buf = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(buf)
  local start_dir = bufname ~= "" and vim.fs.dirname(bufname) or vim.loop.cwd()

  local root_markers = {
    ".git",
    "WORKSPACE",
    "go.mod",
    "pyproject.toml",
    "package.json",
    "lua",
  }

  local found = vim.fs.find(root_markers, { path = start_dir, upward = true })
  if found and #found > 0 then
    return vim.fs.dirname(found[1])
  end

  return vim.loop.cwd()
end

function M.float_term(cmd, opts)
  opts = opts or {}

  local ok_term, terminal_mod = pcall(require, "toggleterm.terminal")
  if ok_term and terminal_mod and terminal_mod.Terminal then
    local Terminal = terminal_mod.Terminal
    local term_cmd
    if type(cmd) == "table" then
      term_cmd = table.concat(cmd, " ")
    else
      term_cmd = cmd
    end

    Terminal:new({ cmd = term_cmd, direction = "float", cwd = opts.cwd }):toggle()
    return
  end

  -- Fallback: bare floating terminal
  local width = math.floor(vim.o.columns * 0.85)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "wipe"

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
  })

  local term_cmd = cmd
  if type(cmd) == "table" then
    term_cmd = cmd
  elseif cmd == nil then
    term_cmd = vim.o.shell
  end

  vim.fn.termopen(term_cmd, { cwd = opts.cwd })
  vim.cmd.startinsert()
end

return M
