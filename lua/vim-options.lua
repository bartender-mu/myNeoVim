vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.background = "light"
vim.opt.swapfile = false
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true


-- -- Key mappings for LSP actions
-- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })


-- Key mappings for neo-tree
-- vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })


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

-- Plugin-specific mappings
-- Telescope (fuzzy finder)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)  -- Find files
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)   -- Live grep
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)     -- List buffers
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)   -- Search help tags

-- LSP (Language Server Protocol)
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', opts)  -- Go to definition
map('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', opts)  -- List references
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)      -- Rename symbol
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts) -- Show code actions

-- Debugging (DAP)
map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>', opts) -- Toggle breakpoint
map('n', '<leader>dc', ':lua require("dap").continue()<CR>', opts)         -- Continue execution
map('n', '<leader>di', ':lua require("dap").step_into()<CR>', opts)        -- Step into
map('n', '<leader>do', ':lua require("dap").step_over()<CR>', opts)        -- Step over
map('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', opts)        -- Open REPL

-- Git shortcuts (using 'tpope/vim-fugitive')
map('n', '<leader>gs', ':Git<CR>', opts)           -- Git status
map('n', '<leader>gc', ':Git commit<CR>', opts)    -- Git commit
map('n', '<leader>gp', ':Git push<CR>', opts)      -- Git push
map('n', '<leader>gl', ':Git log<CR>', opts)       -- Git log

-- File operations (NvimTree)
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
-- map('n', '<leader>e', ':NvimTreeToggle<CR>', opts) -- Toggle NvimTree file explorer
map('n', '<leader>r', ':Neotree buffers<CR>', opts) -- Refresh NvimTree

-- Custom actions
map('n', '<leader>x', ':!chmod +x %<CR>', opts)    -- Make current file executable

