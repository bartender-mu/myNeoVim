-- Full Neovim config with nvim-autopairs, nvim-cmp, and autoformat on save using Lazy.nvim
return {
  -- Autopairs plugin
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter", -- Load when entering insert mode
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" }, -- Disable autopairs for some filetypes
        fast_wrap = {
          map = '<M-e>', -- Key mapping for fast wrapping
          chars = { '{', '[', '(', '"', "'" }, -- Characters to wrap
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''), -- Pattern for fast wrapping
          offset = 0, -- Offset from pattern match
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl', -- Keys to move around for wrapping
          check_comma = true,
          highlight = 'Search', -- Highlighting when wrapping
          highlight_grey = 'Comment' -- Greyed out characters
        }
      })

      -- Optional integration with nvim-cmp if you're using it
      local cmp_status_ok, cmp = pcall(require, 'cmp')
      if cmp_status_ok then
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end
    end
  },

  -- Optional: nvim-cmp completion plugin (add this if you're using nvim-cmp)
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter', -- Load nvim-cmp when entering insert mode
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',   -- Buffer completions
      'hrsh7th/cmp-path',     -- File path completions
      'hrsh7th/cmp-cmdline',  -- Cmdline completions
      'L3MON4D3/LuaSnip',     -- Snippet engine
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For LuaSnip users
          end,
        },
        mapping = {
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' }
        })
      })
    end
  },

  -- LSP configuration with auto-format on save
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.util.default_config = {
        on_attach = function(client, bufnr)
          -- Enable auto-formatting
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd [[
              augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
              augroup END
            ]]
          end
        end,
      }
    end,
  },
}

