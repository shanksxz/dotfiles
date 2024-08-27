return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				lua = { "stylua" },
				svelte = { { "prettierd", "prettier", stop_after_first = true } },
				astro = { { "prettierd", "prettier", stop_after_first = true } },
				javascript = { { "prettierd", "prettier", stop_after_first = true } },
				typescript = { { "prettierd", "prettier", stop_after_first = true } },
				javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
				typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
				json = { { "prettierd", "prettier", stop_after_first = true } },
				graphql = { { "prettierd", "prettier", stop_after_first = true } },
				java = { "google-java-format" },
				markdown = { { "prettierd", "prettier", stop_after_first = true } },
				html = { "htmlbeautifier" },
				bash = { "beautysh" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
				toml = { "taplo" },
				css = { { "prettierd", "prettier", stop_after_first = true } },
				sh = { "shellcheck" },
				go = { "gofmt" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end)
	end,
}
