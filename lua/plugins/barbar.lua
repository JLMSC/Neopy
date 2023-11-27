return {
	'romgrk/barbar.nvim',
	dependencies = {'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons'},
	init = function()
		vim.g.barbar_auto_setup = false

		-- Start and configure gitsigns.
		require('gitsigns').setup({
			numhl = true,
		})

		-- Add Gitsigns mappings to WhichKey.
		local wk = require('which-key')
		wk.register({
			['<leader>'] = {
				g = {
					name = '+Gitsigns',
					p = {'<CMD>Gitsigns toggle_current_line_blame<CR>', 'Toggle current line blame'},
					d = {'<CMD>Gitsigns diffthis ~1 vertical=true split="rightbelow"<CR>', 'Show diffs in the current window/buffer'},
					b = {'<CMD>Gitsigns prev_hunk<CR>', 'Go to previous hunk'},
					n = {'<CMD>Gitsigns next_hunk<CR>', 'Go to next hunk'},
					l = {'<CMD>Gitsigns preview_hunk_inline<CR>', 'Preview hunk inline'},
					L = {'<CMD>Gitsgins preview_hunk<CR>', 'Preview hunk'},
				},
			},
		})

		-- Add Barbar mappings to WhichKey.
		wk.register({
			['<leader>'] = {
				b = {
					name = '+Buffer',
					b = {'<CMD>BufferPrevious<CR>', 'Go to previous Buffer'},
					n = {'<CMD>BufferNext<CR>', 'Go to next Buffer'},
					q = {'<CMD>BufferClose<CR>', 'Close current Buffer'},
					p = {'<CMD>BufferPin<CR>', 'Pin/Unpin current Buffer'},
					r = {'<CMD>BufferRestore<CR>', 'Restore Buffer'},
					h = {'<CMD>BufferPick<CR>', 'Go to Buffer by pick letter'},
					l = {'<CMD>BufferPickDelete<CR>', 'Delete Buffer by pick letter'},
				},
			},
		})
	end,
	opts = {
		animation = true,
		clickable = true,
		focus_on_close = 'previous',
		hide = {
			extensions = false,
		},
		highlight_inactive_file_icons = true,
		icons = {
            separator = {left = '▊', right = ''},
            modified = {button = ''},
			preset = 'default',
		},
		insert_at_end = true,
		sidebar_filetypes = {
			NvimTree = true,
		},
	},
	version = '^1.0.0',
}
