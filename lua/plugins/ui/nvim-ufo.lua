return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	init = function()
		vim.o.foldcolumn = '0'
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Add Nvim-UFO and custom mapping to which key.
		-- TODO: Move to which-key.lua
		local wk = require('which-key')
		wk.register({
			['<leader>'] = {
				-- UFO mappings.
				z = {
					name = '+NvimUFO',
					r = {'zr', 'Open folds except kinds'},
					m = {'zm', 'Close folds'},
					R = {'zR', 'Open all folds'},
					M = {'zM', 'Close all folds'},
					c = {'zc', 'Close one fold under the cursor'},
					C = {'zC', 'Close one fold under the cursor recursively'},
					o = {'zo', 'Open one fold under the cursor'},
					O = {'zO', 'Open one fold under the cursor recursively'},
				},
			},
		})
	end,
}
