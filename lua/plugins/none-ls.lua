return {
  -- Other plugin setups
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting

      null_ls.setup({
        sources = {
          formatting.black.with({ extra_args = { "--fast" } }),   -- Python formatter
          formatting.prettier,                                   -- JavaScript, TypeScript, HTML, CSS formatter
        },
        -- Auto-format on save
        on_attach = function(client, bufnr)
          -- Use 'server_capabilities' instead of 'resolved_capabilities'
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })]]
            vim.api.nvim_command [[augroup END]]
          end
        end,
      })
    end,
  },
}

