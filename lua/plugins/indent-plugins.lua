return {
  -- Indentation guides for version 3 of indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",  -- Use the correct module name for version 3
    config = function()
      require("ibl").setup {
        indent = {
          char = '│', -- Customize your character
        },
        exclude = {
          filetypes = { 'help', 'terminal', 'dashboard', 'NvimTree' }, -- Exclude filetypes
        },
        scope = {
          show_start = true,  -- Show the start of the current block
          show_end = false,   -- Optionally hide the end of the block
        },
      }
    end,
  },

  -- Automatically adjust `shiftwidth` and `expandtab`
  {
    'tpope/vim-sleuth',
  }
}

