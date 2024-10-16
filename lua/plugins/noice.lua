-- plugins/noice.lua
return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			local status_ok, noice = pcall(require, "noice")
			if not status_ok then
				return
			end

			noice.setup({
				views = {
					cmdline_popup = {
						position = {
							row = "40%",
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = "50%",
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
				messages = {
					enabled = true,
					view = "mini",
					view_error = "notify",
					view_warn = "notify",
					view_history = "messages",
					view_search = false,
				},
				lsp = {
					progress = { enabled = false },
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = { enable = false },
					signature = { view = "hover" },
				},
				presets = {
					-- command_palette = true,
					command_palette = {
					  views = {
					    cmdline_popup = {
					      position = {
						row = "50%",
						col = "50%",
					      },
					      size = {
						min_width = 60,
						width = "auto",
						height = "auto",
					      },
					    },
					    cmdline_popupmenu = {
					      position = {
						row = "67%",
						col = "50%",
					      },
					    },
					  },
					},
					long_message_to_split = true,
					lsp_doc_border = true,
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim", -- Required by noice.nvim
			"rcarriga/nvim-notify", -- Optional dependency for notifications
		},
	},
}
