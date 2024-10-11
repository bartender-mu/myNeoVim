return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',      -- Telescope dependency
    { 
      'nvim-telescope/telescope-fzf-native.nvim', 
      build = 'make'  -- Compile the fzf-native extension
    }, 
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup{
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        prompt_prefix = '🔍 ',
        selection_caret = '➤ ',
        path_display = { 'smart' },
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,    -- Set the width of the preview window
            results_width = 0.45,
          },
          width = 0.85,              -- Total width of the Telescope window
          height = 0.80,             -- Total height of the Telescope window
          preview_cutoff = 120,      -- When the preview should be hidden based on the window width
        },
        sorting_strategy = 'ascending',  -- Results appear from top to bottom
        mappings = {
          i = {
            ['<C-n>'] = require('telescope.actions').move_selection_next,
            ['<C-p>'] = require('telescope.actions').move_selection_previous,
            ['<C-c>'] = require('telescope.actions').close,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = true,         -- Enable file preview for find_files
        },
        buffers = {
          theme = "dropdown",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
      },
    }

    -- Load the fzf extension if installed
    telescope.load_extension('fzf')
  end,
}

