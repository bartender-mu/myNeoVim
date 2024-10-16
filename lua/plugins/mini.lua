return {

}
-- return {
--   {
--     'echasnovski/mini.nvim',
--     version = '*',
--     config = function()
--       -- Load Mini Modules
--       require('mini.comment').setup({
--         options = {
--           ignore_blank_line = true,
--           hook = function()
--             require('ts_context_commentstring.internal').update_commentstring({
--               key = '__multiline',
--             })
--           end,
--         },
--       })

--       require('mini.surround').setup({
--         mappings = {
--           add = 'sa',
--           delete = 'sd',
--           find = 'sf',
--           update_n_lines = 'sn',
--         },
--       })

--       require('mini.starter').setup({
--         evaluate_single = true,
--         content = {
--           { name = 'New File', action = 'enew', },
--           { name = 'Recent Files', action = 'Telescope oldfiles', },
--           { name = 'Search Text', action = 'Telescope live_grep', },
--           { name = 'Open Git', action = 'LazyGit', },
--         },
--         header = function()
--           return "Welcome to Neovim!"
--         end,
--         footer = function()
--           return "Have a great day!"
--         end,
--       })

--       require('mini.statusline').setup({
--         content = {
--           active = {
--             { ' %f %m %r ', hl = 'StatusLine' },
--             { ' %y ', hl = 'StatusLine' },
--             { ' %p%% ', hl = 'StatusLine' },
--             { ' %l:%c ', hl = 'StatusLine' },
--           },
--           inactive = {
--             { ' %f ', hl = 'StatusLineNC' },
--           },
--         },
--         winbar = {
--           active = {
--             { ' %f ', hl = 'StatusLine' },
--           },
--           inactive = {
--             { ' %f ', hl = 'StatusLineNC' },
--           },
--         },
--       })

--       require('mini.icons').setup({
--         kinds = {
--           Class = '',
--           Function = '',
--           Method = '',
--           -- Add more kinds as needed
--         },
--       })
--     end,
--   },
-- }

