local chat = require("CopilotChat")

chat.setup({
	debug = false,
	proxy = nil,
	allow_insecure = false,
	model = "gpt-4o",
	agent = "copilot",
	context = "buffers",
	temperature = 0.1,

	question_header = "# User ",
	answer_header = "# Copilot ",
	error_header = "# Error ",
	separator = "───",

	show_folds = true,
	show_help = true,
	auto_follow_cursor = false,
	auto_insert_mode = false,
	clear_chat_on_new_prompt = false,
	highlight_selection = true,

	chat_autocomplete = true,
	history_path = vim.fn.stdpath("data") .. "/copilot_chat_history",
	callback = nil,

	window = {
		layout = "vertical",
		width = 0.45,
		height = 0.4,
		relative = "editor",
		border = "rounded",
		row = nil,
		col = nil,
		title = " Copilot Chat",
		footer = nil,
		zindex = 1,
	},

	mappings = {
		complete = {
			insert = "<Tab>",
		},
		close = {
			normal = "q",
			insert = "<C-c>",
		},
		reset = {
			normal = "<C-r>",
			insert = "<C-r>",
		},
		submit_prompt = {
			normal = "<CR>",
			insert = "<C-s>",
		},
		toggle_sticky = {
			detail = "Makes line under cursor sticky or deletes sticky line.",
			normal = "gr",
		},
		accept_diff = {
			normal = "<C-y>",
			insert = "<C-y>",
		},
		jump_to_diff = {
			normal = "gj",
		},
		quickfix_diffs = {
			normal = "gq",
		},
		yank_diff = {
			normal = "gy",
			register = '"',
		},
		show_diff = {
			normal = "gd",
		},
		show_info = {
			normal = "gi",
		},
		show_context = {
			normal = "gc",
		},
		show_help = {
			normal = "gh",
		},
	},
})

return chat
