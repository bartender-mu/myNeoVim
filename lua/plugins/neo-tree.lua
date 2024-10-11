return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true, -- Close Neo-tree when it's the last window
      popup_border_style = "rounded", -- Rounded borders for popups
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          padding = 1,
          with_expanders = true, -- Enables expand/collapse arrows
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        modified = {
          symbol = "[+]", -- Symbol for modified files
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "",
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          },
        },
      },
      window = {
        position = "left", -- Can also be "right" or "float"
        width = 30,
        mappings = {
          ["o"] = "open",
          ["l"] = "open",
          ["h"] = "close_node",
          ["v"] = "open_vsplit",
          ["s"] = "open_split",
          ["C"] = "close_all_nodes",
          ["R"] = "refresh",
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Show dotfiles
          hide_gitignored = true,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
          },
        },
        follow_current_file = true, -- Automatically focus the current file
        group_empty_dirs = true, -- Group empty folders together
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true, -- Automatically refresh changes
      },
      buffers = {
        follow_current_file = true,
        group_empty_dirs = true,
      },
      git_status = {
        window = {
          position = "float",
        },
      },
    }
  end
}

--
--
-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	config = function()
-- 		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
-- 		vim.keymap.set("n", "<leader>ef", ":Neotree buffers reveal float<CR>", {})
-- 	end,
-- }
