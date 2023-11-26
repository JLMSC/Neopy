return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.4',
	dependencies = {'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter'},
	config = function()
		local actions = require('telescope.actions')
		require('telescope').setup({
			defaults = {
				mappings = {
					i = {
						['<ESC>'] = actions.close
					},
				},
			},
		})
		-- Add Telescope mapping to WhichKey.
		local wk = require('which-key')
		wk.register({
			['<leader>'] = {
				t = {
					name = '+Telescope',
					f = {'<CMD>Telescope find_files<CR>', 'Open file'},
					g = {'<CMD>Telescope live_grep<CR>', 'Live grep'},
					b = {'<CMD>Telescope buffers<CR>', 'Buffers'},
					h = {'checkhealth telescope<CR>', 'Check Telescope health'},
				},
			},
		})
	end,
}
