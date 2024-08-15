return {
	"stevearc/conform.nvim",

	config = function()
		require("conform").setup({

			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {
				noremap = true,
				desc = "Format current buffer",
			}),

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallbac",
			},

			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
			},

			-- setup biome for mostly everything
			formatters = {
				biome = {
					exe = "biome",
					args = { "-" },
					stdin = true,
				},
			},
		})
	end,
}
