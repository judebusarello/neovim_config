return {
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      level = vim.log.levels.INFO,
      timeout = 100,
      stages = "fade",
      minimum_width = 0,
      fps = 60,
      top_down = true,
      render = function(bufnr, notif)
        local padded_message = vim.tbl_map(function(line)
          return "  " .. line .. "  "
        end, notif.message)
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, padded_message)
      end,
    },
  },
}
