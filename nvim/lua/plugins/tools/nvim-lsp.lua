local lspconfig = require("lspconfig")
local default_capabilities = require("blink.cmp").get_lsp_capabilities()

-- Setup basic diagnostic signs
local signs = {
	Error = "E",
	Warn = "W",
	Hint = "H",
	Info = "I",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Configure servers
lspconfig.lua_ls.setup({
	capabilities = default_capabilities,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = { vim.env.VIMRUNTIME } },
			format = {
				enable = true,
				defaultConfig = {
					align_continuous_assign_statement = false,
					align_continuous_rect_table_field = false,
					align_array_table = false,
				},
			},
		},
	},
})

lspconfig.gopls.setup({
	capabilities = default_capabilities,
	filetypes = { "go", "gomod" },
})

-- Setup other servers with default configuration
local servers = {
	"tsserver",
	"tailwindcss",
	"clangd",
	"rust_analyzer",
	"jsonls",
	"jdtls",
	"bufls",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		capabilities = default_capabilities,
	})
end
