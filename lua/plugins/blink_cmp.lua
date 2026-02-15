return {
  {
    "saghen/blink.cmp",
    enabled = false,
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
      -- keymap = {
      --   accept = ";",
      --   select_prev = { "<S-Tab>" },
      --   select_next = { "<Tab>" },
      -- },
      -- highlight = {
      --   use_nvim_cmp_as_default = true,
      -- },
      -- nerd_font_variant = "normal",
      -- accept = {
      --   auto_brackets = {
      --     enabled = true,
      --   },
      -- },
      -- windows = {
      --   autocomplete = {
      --     draw = "minimal",
      --   },
      --   documentation = {
      --     auto_show = true,
      --   },
      -- },
      -- documentation = {
      --   auto_show = true,
      --   auto_show_delay_ms = 50,
      --   update_delay_ms = 50,
      -- },
      -- signature_help = {
      --   enabled = true,
      --   blocked_trigger_characters = {},
      --   blocked_retrigger_characters = {},
      --   -- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
      --   show_on_insert_on_trigger_character = true,
      -- },
      -- cycle = {
      --   from_bottom = false,
      --   from_top = false,
      -- },
    },
  },
}
