-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup("filename_alert"),
  callback = function()
    require("notify").dismiss({ silent = true })
    require("notify")(vim.fn.expand("%:t"))
  end,
})
