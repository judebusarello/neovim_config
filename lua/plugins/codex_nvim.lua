return {
  {
    "kkrampis/codex.nvim",
    lazy = true,
    cmd = { "Codex", "CodexToggle" }, -- Optional: Load only on command execution
    keys = {
      {
        "<leader>c", -- Change this to your preferred keybinding
        function()
          require("codex").toggle()
          vim.api.nvim_command("startinsert")
        end,
        desc = "Toggle Pi popup or side-panel",
        mode = {"n"},
      },
    },
    opts = {
      cmd = "pi", -- Use the pi.dev harness in the terminal popup
      keymaps = {
        toggle = nil, -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
        quit = "<S-Esc>", -- Keybind to close the Pi window
      }, -- Disable internal default keymap (<leader>cc -> :CodexToggle)
      border = "rounded", -- Options: 'single', 'double', or 'rounded'
      width = 0.8, -- Width of the floating window (0.0 to 1.0)
      height = 0.8, -- Height of the floating window (0.0 to 1.0)
      model = nil, -- Use Pi's configured default model
      autoinstall = false, -- Never install the Codex CLI when Pi is missing
      panel = false, -- Open Pi in a floating window instead of a vertical split
      use_buffer = false, -- Run Pi interactively in a terminal buffer
    },
  },
}
