return {
	'romgrk/barbar.nvim',
	dependencies = {'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons'},
	init = function()
		vim.g.barbar_auto_setup = false

		-- Start and configure gitsigns.
		require('gitsigns').setup({
			numhl = true,
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
