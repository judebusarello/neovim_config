local reblame_history = {}
local reblame_buffers = {}

local function cleanup_reblame_buffer(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    reblame_buffers[buf] = nil
    return
  end
  if not reblame_buffers[buf] or vim.bo[buf].modified then
    return
  end
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == buf then
      return
    end
  end
  for win, history in pairs(reblame_history) do
    if vim.api.nvim_win_is_valid(win) then
      for _, entry in ipairs(history) do
        if entry.buf == buf then
          return
        end
      end
    end
  end
  vim.api.nvim_buf_delete(buf, {})
  reblame_buffers[buf] = nil
end

return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    lazy = false,
    keys = {
      {
        "c",
        function()
          local buf = vim.api.nvim_get_current_buf()
          local win = vim.api.nvim_get_current_win()
          local cursor = vim.api.nvim_win_get_cursor(win)
          local view = vim.fn.winsaveview()
          local cache = require("gitsigns.cache").cache[buf]
          if not cache then
            return
          end

          require("gitsigns.async").run(function()
            local entry = cache:get_blame(cursor[1], { ignore_whitespace = true })
            if not cache:schedule() or vim.api.nvim_get_current_win() ~= win
              or vim.api.nvim_get_current_buf() ~= buf
              or not vim.deep_equal(vim.api.nvim_win_get_cursor(win), cursor) then
              return
            end
            if not entry or entry.commit.sha:match("^0+$") then
              vim.notify("Current line is not committed", vim.log.levels.INFO)
              return
            end

            local revision = entry.commit.sha
            local filename = entry.filename
            if revision == cache.git_obj.revision then
              revision = entry.previous_sha
              filename = entry.previous_filename
              if not revision then
                vim.notify("No earlier revision for this line", vim.log.levels.INFO)
                return
              end
            end

            -- Gitsigns wipes revision buffers when hidden; keep them for undo.
            local bufhidden = vim.bo[buf].bufhidden
            if bufhidden == "wipe" then
              vim.bo[buf].bufhidden = "hide"
            end
            if require("gitsigns.actions.diffthis").show(buf, revision, filename) then
              reblame_buffers[vim.api.nvim_get_current_buf()] = true
              reblame_history[win] = reblame_history[win] or {}
              table.insert(reblame_history[win], { buf = buf, view = view })
              local line = math.min(entry.orig_lnum, vim.api.nvim_buf_line_count(0))
              vim.api.nvim_win_set_cursor(win, { line, cursor[2] })
            elseif vim.api.nvim_buf_is_valid(buf) then
              vim.bo[buf].bufhidden = bufhidden
            end
          end)
        end,
        desc = "Reblame current line without panel",
        mode = "n",
      },
      {
        "C",
        function()
          local history = reblame_history[vim.api.nvim_get_current_win()]
          if not history or #history == 0 then
            vim.notify("No reblame jump to undo", vim.log.levels.INFO)
            return
          end
          local previous = history[#history]
          if not vim.api.nvim_buf_is_valid(previous.buf) then
            table.remove(history)
            vim.notify("Previous blame buffer was deleted", vim.log.levels.WARN)
            return
          end
          local leaving = vim.api.nvim_get_current_buf()
          vim.api.nvim_win_set_buf(0, previous.buf)
          vim.fn.winrestview(previous.view)
          table.remove(history)
          cleanup_reblame_buffer(leaving)
        end,
        desc = "Undo last reblame jump",
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
        "<leader>C",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "reset the hunk to what it use to be",
        mode = "n",
      },
      {
        ";",
        function()
          require("gitsigns").blame_line({
            full = true,
            ignore_whitespace = true,
          })
        end,
        desc = "Show commit message of the current line",
        mode = "n",
      },
      {
        "<leader>B",
        "<cmd>Gitsigns blame<cr>",
        desc = "Blame file",
      },
      {
        "<leader>ub",
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        desc = "Toggle inline blame",
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("GitsignsReblameWithoutPanel", { clear = true }),
        pattern = "gitsigns-blame",
        callback = function(event)
          -- Gitsigns installs its own mappings after setting the filetype.
          vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(event.buf) then
              return
            end

            local function reblame(parent)
              local panel = vim.api.nvim_get_current_win()
              local name = vim.api.nvim_buf_get_name(event.buf)
              local line = vim.api.nvim_win_get_cursor(panel)[1]
              for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                local buf = vim.api.nvim_win_get_buf(win)
                local cache = require("gitsigns.cache").cache[buf]
                if cache and cache:get_rev_bufname():gsub("^gitsigns:", "gitsigns-blame:") == name then
                  local entry = cache.blame and cache.blame.entries[line]
                  if not entry then
                    return
                  end
                  local revision = entry.commit.sha .. (parent and "^" or "")
                  if revision == cache.git_obj.revision then
                    return
                  end
                  vim.api.nvim_win_close(panel, true)
                  vim.api.nvim_set_current_win(win)
                  require("gitsigns").show(revision)
                  return
                end
              end
            end

            vim.keymap.set("n", "r", function()
              reblame(false)
            end, { buffer = event.buf, desc = "Reblame at commit without panel" })
            vim.keymap.set("n", "R", function()
              reblame(true)
            end, { buffer = event.buf, desc = "Reblame at commit parent without panel" })
          end)
        end,
      })

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
