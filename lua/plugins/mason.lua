-- init.lua or plugins.lua

-- Add Mason and Mason LSP Config to your plugin list
return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason" },
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "tsserver", "rust_analyzer" }, -- Add your preferred language servers here
            })

            local lspconfig = require("lspconfig")

            -- Default handler for language servers
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup {}
                end,
            })

            -- Example: custom configuration for Pyright
            lspconfig.pyright.setup {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic", -- Change as needed
                        },
                    },
                },
            }
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,  -- Python formatter
                    null_ls.builtins.diagnostics.eslint, -- JavaScript linter
                },
            })
        end,
    },
}

