-- LazyVim configuration for telescope.nvim with ui-select customization
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

      -- Telescope setup
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
              preview_height = 0.7,
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
            previewer = false,
          },
          live_grep = {
            theme = "ivy",
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
              winblend = 15,                -- Transparency of the popup window
              layout_config = {
                width = 0.4,                -- Adjust the width of the dropdown
                height = 0.3,               -- Adjust the height of the dropdown
              },
              border = true,                -- Show border around the dropdown
              borderchars = {               -- Customize the border style
                '─', '│', '─', '│', '╭', '╮', '╯', '╰'
              },
              previewer = false,            -- Disable previewer in the dropdown
              prompt_title = false,         -- Hide prompt title
              results_title = false,        -- Hide results title
            }),
          },
        },
      })

      -- Load Telescope extensions
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('file_browser')

      -- Custom keybindings
      vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope file_browser<CR>', { noremap = true, silent = true })
    end,
  },
}

