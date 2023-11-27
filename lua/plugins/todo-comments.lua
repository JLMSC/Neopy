return {
	'folke/todo-comments.nvim',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
		local latte = require('catppuccin.palettes').get_palette('latte')
		require('todo-comments').setup({
			highlight = {
				before = '',
				keyword = 'wide_fg',
				after = 'fg',
			},
			ui_style = {
				fg = "BOLD",
			},
			keywords = {
				-- TODO: Add custom keywords to match 'better comments' from vscode.
				-- FIXME: I'm pretty sure there's a way to avoid use of upper and lower cases here with regex. (find out how)
				FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "fixme", "fix", "bug", "fixit", "issue" } },
				TODO = { icon = " ", color = "info", alt = { "todo", } },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "warn", "warning", } },
				TEST = { icon = " ", color = "hint", alt = { "test", } },
			},
			colors = {
				error = {'DiagnosticError', 'ErrorMsg', latte.maroon},
				warning = {'DiagnosticWarn', 'WarningMsg', latte.yellow},
				info = {'DiagnosticInfo', latte.sky},
				hint = {'DiagnosticHint', latte.sapphire},
				default = {'Identifier', latte.mauve},
				test = {'Identifier', latte.green},
			},
		})
		-- Add TodoComments mappings to WhichKey.
		local wk = require('which-key')
		wk.register({
			['<leader>'] = {
				p = {
					name = '+TodoComments',
					o = {'<CMD>TodoQuickFix<CR>', 'Search all todos in project'},
					b = {'<CMD>lua require("todo-comments").jump_prev()<CR>', 'Go to previous todo'},
					n = {'<CMD>lua require("todo-comments").jump_next()<CR>', 'Go to next todo'},
				},
			},
		})
	end,
}
