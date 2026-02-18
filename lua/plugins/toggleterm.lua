return {
  {
    "akinsho/toggleterm.nvim",
    enabled = true,
    config = function()
      require("toggleterm").setup({
        direction = "float",
        auto_scroll = false,
        start_in_insert = true,
        on_open = function(term)
          local ok_ui, ui = pcall(require, "toggleterm.ui")
          if not ok_ui or not ui or not term or not term.window then return end

          local origin_win = ui.get_origin_window and ui.get_origin_window() or nil
          if not origin_win or not vim.api.nvim_win_is_valid(origin_win) then return end
          if not vim.api.nvim_win_is_valid(term.window) then return end

          local origin_statusline = vim.api.nvim_get_option_value("statusline", { win = origin_win })
          if not origin_statusline or origin_statusline == "" then
            origin_statusline = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P"
          end

          local ok_eval, evaluated =
            pcall(vim.api.nvim_eval_statusline, origin_statusline, { winid = origin_win, maxwidth = vim.o.columns })
          if not ok_eval or not evaluated or type(evaluated.str) ~= "string" then return end

          vim.wo[term.window].statusline = evaluated.str
        end,
        float_opts = {
          border = "curved",
          width = 300,
          height = 100,
        },
      })
    end,
    keys = {
      -- Scratch terminals
      {
        "<leader>j",
        function()
          require("toggleterm").toggle(1, 0, vim.loop.cwd(), "float")
        end,
        desc = "Open scratch terminal 1",
        mode = "n",
      },
      {
        "<leader>k",
        function()
          require("toggleterm").toggle(2, 0, vim.loop.cwd(), "float")
        end,
        desc = "Open scratch terminal 2",
        mode = "n",
      },
      {
        "<leader>l",
        function()
          require("toggleterm").toggle(3, 0, vim.loop.cwd(), "float")
        end,
        desc = "Open scratch terminal 3",
        mode = "n",
      },

      -- Spotify CLI
      {
        "<leader>m",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({ id = 999999999, cmd = "spotify_player" }):toggle()
        end,
        desc = "Open Spotify CLI",
        mode = "n",
      },

      -- Close all terminals
      {
        "<S-enter>",
        function()
          for _, term in pairs(require("toggleterm.terminal").get_all()) do
            term:close()
          end
        end,
        desc = "Close all terminals",
        mode = "n",
      },
      {
        "<S-esc>",
        function()
          for _, term in pairs(require("toggleterm.terminal").get_all()) do
            term:close()
          end
        end,
        desc = "Close all terminals (terminal mode)",
        mode = "t",
      },

      -- Lazygit
      {
        "<leader>g",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({ id = 999999998, cmd = "lazygit", direction = "float" }):toggle()
        end,
        desc = "Open Lazygit",
        mode = "n",
      },

      -- Oxker
      {
        "<leader>d",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          Terminal:new({ id = 999999997, cmd = "oxker", direction = "float" }):toggle()
        end,
        desc = "Open Oxker (docker)",
        mode = "n",
      },

      -- -- Lazydocker
      -- {
      --   "<leader>D",
      --   function()
      --     local Terminal = require("toggleterm.terminal").Terminal
      --     Terminal
      --         :new({ id = 999999997, cmd = "lazydocker", direction = "float" })
      --         :toggle()
      --   end,
      --   desc = "Open Lazydocker",
      --   mode = "n",
      -- },
      --
      -- GitHub Dashboard
      -- {
      --   "<leader>G",
      --   function()
      --     local Terminal = require("toggleterm.terminal").Terminal
      --     Terminal:new({ id = 999999996, cmd = "gh dash", direction = "float" })
      --         :toggle()
      --   end,
      --   desc = "Open GitHub Dashboard",
      --   mode = "n",
      -- },
    },
  },
}
