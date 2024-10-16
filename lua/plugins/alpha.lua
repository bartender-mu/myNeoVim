-- Full Neovim config with nvim-autopairs, nvim-cmp, autoformat on save, and alpha.nvim
return {
  -- Alpha dashboard
  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set the header and other options as needed
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }
      -- Center the dashboard layout
      dashboard.layout = {
        { type = "text", val = "Welcome to Neovim!", opts = { position = "center", hl = "Type" } },
        { type = "text", val = "Your options are below:", opts = { position = "center", hl = "Identifier" } },
      }

      -- Optional: Add a list of shortcuts or commands
      dashboard.section.buttons.val = {
        dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
        dashboard.button("n", "📄  New file", ":enew<CR>"),
        dashboard.button("r", "📂  Recently used files", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "⚙️  Settings", ":e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("q", "🚪  Quit Neovim", ":qa<CR>"),
      }

      -- Setup alpha
      alpha.setup(dashboard.opts)
    end
  },
}
