return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")

        wk.setup {
            plugins = {
                spelling = { enabled = true },
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 5,
                align = "left",
            },
            show_help = true,
            default_options = {
                show_warnings = false, -- Disable warnings
            },
        }

        -- Define your key mappings
        wk.register({
            -- { "<leader><leader>/", desc = "<cmd>CommentToggle<cr>" },
            -- Other mappings here
        }, {  })
    end,
}

