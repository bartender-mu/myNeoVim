vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.background = "light"
vim.opt.swapfile = false
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- Define leader key
vim.g.mapleader = " "  -- Space key as the leader key

-- Key mappings using leader key
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General shortcuts
map('n', '<leader>w', ':w<CR>', opts)            -- Save file
map('n', '<leader>q', ':q<CR>', opts)            -- Quit Neovim
map('n', '<leader>h', ':nohlsearch<CR>', opts)   -- Clear search highlight
map('n', '<leader>v', ':vsp<CR>', opts)          -- Open vertical split
map('n', '<leader>s', ':sp<CR>', opts)           -- Open horizontal split
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts) -- Toggle file explorer

-- Buffer management
map('n', '<leader>bn', ':bnext<CR>', opts)       -- Go to next buffer
map('n', '<leader>bp', ':bprev<CR>', opts)       -- Go to previous buffer
map('n', '<leader>bd', ':bd<CR>', opts)          -- Close current buffer

-- Window navigation
map('n', '<leader>h', '<C-w>h', opts)            -- Move left between windows
map('n', '<leader>j', '<C-w>j', opts)            -- Move down between windows
map('n', '<leader>k', '<C-w>k', opts)            -- Move up between windows
map('n', '<leader>l', '<C-w>l', opts)            -- Move right between windows

-- File operations (NvimTree)
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
-- map('n', '<leader>e', ':NvimTreeToggle<CR>', opts) -- Toggle NvimTree file explorer
map('n', '<leader>r', ':Neotree buffers<CR>', opts) -- Refresh NvimTree

-- Custom actions
map('n', '<leader>x', ':!chmod +x %<CR>', opts)    -- Make current file executable

-- Map <leader>c to close the current buffer
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { silent = true })

