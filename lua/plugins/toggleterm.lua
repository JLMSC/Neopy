return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup({})

		-- Add Toggleterm mapping to WhichKey.
		local wk = require('which-key')
		wk.register({
			['<leader>T'] = {'<CMD>ToggleTerm direction=float<CR>', 'Open terminal'},
		})
	end,
}
