-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   group = augroup("filename_alert"),
--   callback = function()
--     require("notify").dismiss({ silent = true })
--     require("notify")(vim.fn.expand("%:t"))
--   end,
-- })
--
--augroup git_commit
--     autocmd!
--
--     autocmd BufReadPost *
--         \  if &filetype == 'gitcommit'
--         \|     execute 'normal $'
--         \| endif
-- augroup end
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
-- Janky autocmd to skip past the goofy octo screen before a review
vim.api.nvim_create_autocmd('OptionSet', {
  group = augroup("octo_autoreview"),
  callback = function(opts)
    if vim.fn.expand('<amatch>') == "buftype" and vim.bo[opts.buf].filetype == 'octo' then
      vim.cmd 'Octo review start'
    end
  end,
})
