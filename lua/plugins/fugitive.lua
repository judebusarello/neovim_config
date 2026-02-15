return {
  {
    "tpope/vim-fugitive",
    enabled = true,
    config = function()
      -- Function to blame the current line and open the corresponding commit in git fugitive
      local function gblameline()
        local lineno = vim.api.nvim_win_get_cursor(0)[1] -- Get the current line number
        local filename = vim.api.nvim_buf_get_name(0) -- Get the current buffer's file name

        -- Execute git blame for the current line
        local output = vim.fn.system({
          "git",
          "blame",
          "-L",
          lineno .. "," .. lineno,
          filename,
        })

        if vim.v.shell_error ~= 0 then
          vim.notify("Shell error: " .. vim.fn.trim(output), vim.log.levels.ERROR)
          return
        end

        -- Extract the commit hash from the git blame output
        local blame_hash = string.match(vim.fn.trim(output), "^%S+")
        if blame_hash and blame_hash ~= "" then
          -- Open the commit in git fugitive
          vim.cmd("Gedit " .. blame_hash)
        else
          vim.notify(
            "Unable to extract commit hash from git blame output",
            vim.log.levels.ERROR
          )
        end
      end

      -- Keymap to blame the current line and open it in git fugitive
      vim.keymap.set(
        "n",
        "<leader>GL",
        gblameline,
        { desc = "Blame current line and open in git fugitive" }
      )
      local function gbrowseline()
        local lineno = vim.api.nvim_win_get_cursor(0)[1] -- Get the current line number
        local filename = vim.api.nvim_buf_get_name(0) -- Get the current buffer's file name

        -- Execute git blame for the current line
        local output = vim.fn.system({
          "git",
          "blame",
          "-L",
          lineno .. "," .. lineno,
          filename,
        })

        if vim.v.shell_error ~= 0 then
          vim.notify("Shell error: " .. vim.fn.trim(output), vim.log.levels.ERROR)
          return
        end

        -- Extract the commit hash from the git blame output
        local blame_hash = string.match(vim.fn.trim(output), "^%S+")
        if blame_hash and blame_hash ~= "" then
          -- Execute GBrowse with the commit hash
          vim.cmd("GBrowse " .. blame_hash)
        else
          vim.notify(
            "Unable to extract commit hash from git blame output",
            vim.log.levels.ERROR
          )
        end
      end

      -- Keymap to blame the current line and open it in Gbrowse
      vim.keymap.set("n", "c", gbrowseline, {
        desc = "Blame current line and open in Gbrowse",
      })
    end,
  },
}
