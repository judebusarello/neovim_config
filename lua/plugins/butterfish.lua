return {
  {
    "bakks/butterfish.nvim",
    enabled = true,
    dependencies = { "tpope/vim-commentary" },
    keys = {
      {
        "E",
        function()
          vim.ui.input({ prompt = "Butterfish Question: " }, function(msg)
            local butterfish = require("butterfish")
            butterfish.question(vim.fn.line("'<"), vim.fn.line("'>"), msg)
          end)
        end,
        mode = { "v" },
        desc = "Butterfish Question",
      },
      {
        "R",
        function()
          vim.ui.input({ prompt = "Butterfish Rewrite: " }, function(msg)
            local butterfish = require("butterfish")
            butterfish.rewrite(vim.fn.line("'<"), vim.fn.line("'>"), msg)
          end)
        end,
        mode = { "v" },
        desc = "Butterfish Rewrite",
      },
    },
    config = function()
      local butterfish = require("butterfish")
      -- butterfish.lm_base_path = "http://localhost:1234/v1"
      -- butterfish.lm_fast_model = "ZeroWw/microsoft_WizardLM-2-7B-GGUF"
      -- butterfish.lm_smart_model = "ZeroWw/microsoft_WizardLM-2-7B-GGUF"
      butterfish.lm_base_path = "https://api.openai.com/v1"
      butterfish.lm_fast_model = "gpt-4o-2024-11-20"
      butterfish.lm_smart_model = "gpt-4o-2024-11-20"
      butterfish.active_color_group = "User1"
      butterfish.active_color_cterm = "8"
      butterfish.active_color_gui = "#808080"
    end,
  },
}
