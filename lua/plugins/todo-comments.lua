return {
	'folke/todo-comments.nvim',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
		require('todo-comments').setup({
			highlight = {
				before = '',
				keyword = 'wide_fg',
				after = 'fg',
				-- warn: this can be a single regex (just add : as optional)
				-- fixme: Still not what I want, it NEEDS to be case insensitive.
				pattern = {
					[[\s*<(KEYWORDS)\s+]],
					[[\s*<(KEYWORDS):\s+]],
				},
				comments_only = true,
			},
			ui_style = {
				fg = "BOLD",
			},
			keywords = {
				-- TODO: Add custom keywords to match 'better comments' from vscode.
				FIXME = { icon = " ", color = "error", alt = {'fixme',},},
				WARN = { icon = " ", color = "warning", alt = {'warn'},},
				TODO = { icon = " ", color = "info", alt = {'todo'},},
				TEST = { icon = " ", color = "hint", alt = {'test'},},
			},
			colors = {
				error = {'DiagnosticError'},
				warning = {'DiagnosticWarn'},
				info = {'DiagnosticInfo'},
				hint = {'DiagnosticHint'},
			},
			search = {
				command = 'rg',
				args = {
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--ignore-case',
				},
				-- Workaround I found ...
				-- Just add more comments to the group lol
				-- todo: This should produce the same result from vim regex.
				pattern = [[(-|#|"|')+\s*(KEYWORDS):?\s+]],
			},
		})

		-- Add TodoComments mappings to WhichKey.
		-- TODO: Move to which-key.lua
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
