return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup({})
		
		-- Add Toggleterm mappings to WhichKey.
		-- TODO: Move to which-key.lua
		local wk = require('which-key')
		wk.register({
			['<leader>T'] = {'<CMD>ToggleTerm direction=float<CR>', 'Open terminal'},
		})
	end,
}
