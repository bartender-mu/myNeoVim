return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
      {'nvim-telescope/telescope-ui-select.nvim'},
      {'nvim-telescope/telescope-file-browser.nvim'},
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          prompt_prefix = "🔭 ",
          selection_caret = "➜ ",
          path_display = { "smart" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              preview_width = 0.6,
              results_width = 0.8,
            },
            vertical = {
              preview_height = 0.5,  -- Adjust preview height if needed
              mirror = false,
            },
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<C-c>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = true,
            layout_strategy = "horizontal",  -- Use horizontal layout for find_files
            layout_config = {
              width = 0.8,          -- Set the width of the find_files window to 80% of the screen
              height = 0.6,         -- Set the height of the find_files window to 60% of the screen
            },
          },
          live_grep = {
            theme = "ivy",
            layout_strategy = "vertical",
            layout_config = {
              vertical = {
                preview_height = 0.5,
              },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              winblend = 15,
              layout_config = {
                width = 0.4,
                height = 0.3,
              },
              border = true,
              borderchars = {
                '─', '│', '─', '│', '╭', '╮', '╯', '╰'
              },
              previewer = false,
              prompt_title = false,
              results_title = false,
            }),
          },
        },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('file_browser')

      -- Custom keybindings
      vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>Telescope file_browser<CR>', { noremap = true, silent = true })
    end,
  },
}

