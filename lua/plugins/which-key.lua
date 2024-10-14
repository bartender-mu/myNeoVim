return {
  -- Configuration for which-key.nvim
  {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {
        plugins = {
          marks = true,         -- Shows a popup with marks
          registers = true,     -- Shows your registers
          spelling = {
            enabled = true,     -- Show spelling suggestions
            suggestions = 20,   -- Maximum number of suggestions
          },
        },
        window = {
          border = "rounded",   -- Rounded borders for popup
          position = "bottom",  -- Display at the bottom
          margin = { 1, 0, 1, 0 }, -- Margins around the popup
          padding = { 2, 2, 2, 2 }, -- Padding inside the window
        },
        layout = {
          spacing = 6, -- Spacing between columns
        },
        ignore_missing = false, -- Show all keys even if they don’t have a mapping
        show_help = true,       -- Show help message in the popup
      }
    end,
  },

  -- Configuration for vim-commentary (no config needed, works out of the box)
  {
    'tpope/vim-commentary',
  }
}
