return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },

  config = function()
    -- Define color scheme
    local colors = {
      blue   = '#80a0ff',
      cyan   = '#79dac8',
      black  = '#080808',
      white  = '#c6c6c6',
      red    = '#ff5189',
      violet = '#d183e8',
      grey   = '#303030',
    }

    -- Define the custom "bubbles" theme
    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    -- Setup lualine with custom theme
    local lualine = require('lualine')
    lualine.setup {
      options = {
        theme = bubbles_theme,  -- Use the custom "bubbles" theme
        component_separators = '',  -- No separators between components
        section_separators = { left = '', right = '' },  -- Bubble effect separators
      },
      sections = {
        -- Bubble for the current mode (NORMAL, INSERT, etc.)
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        
        -- Filename and git branch
        lualine_b = { 'filename', 'branch' },
        
        -- Central section for any custom components
        lualine_c = {
          '%=',  -- Ensures center alignment for the next component
          -- Add any additional components you want in the center here
        },

        -- Additional sections (empty by default)
        lualine_x = {},

        -- Filetype and progress percentage (right side)
        lualine_y = { 'filetype', 'progress' },

        -- Bubble for the cursor position with right separator
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },

      -- Inactive window sections (simplified)
      inactive_sections = {
        lualine_a = { 'filename' },  -- Shows the filename in inactive windows
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },

      tabline = {},
      extensions = {},
    }
  end
}

