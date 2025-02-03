local lspsaga = require("lspsaga")
local map = require("core.mappings")

lspsaga.setup({
	ui = {
		border = "rounded",
		colors = {
			normal_bg = "#1d1536",
		},
	},
	hover = {
		max_width = 0.6,
		max_height = 0.6,
		open_link = "gx",
	},
	code_action = {
		num_shortcut = true,
		show_server_name = true,
		extend_gitsigns = true,
		sign = false,
		virtual_text = true,
	},
	diagnostic = {
		show_code_action = true,
		show_source = true,
		jump_num_shortcut = true,
		max_width = 0.7,
		max_height = 0.6,
		text_hl_follow = true,
		border_follow = true,
		extend_relatedInformation = false,
		diagnostic_only_current = false,
	},
	finder = {
		max_height = 0.5,
		left_width = 0.3,
		right_width = 0.3,
		default = "ref+imp",
	},
	definition = {
		width = 0.6,
		height = 0.5,
	},
	rename = {
		in_select = false,
		auto_save = false,
		project_max_width = 0.5,
		project_max_height = 0.5,
	},
	outline = {
		win_position = "right",
		win_width = 30,
		auto_preview = true,
		detail = true,
		auto_close = true,
		close_after_jump = false,
		layout = "normal",
	},
})

map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to definition" })
map("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "Go to references" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show documentation" })
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code actions" })
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show line diagnostics" })
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show cursor diagnostics" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous diagnostic" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" })
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Toggle outline" })
map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Show incoming calls" })
map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Show outgoing calls" })
