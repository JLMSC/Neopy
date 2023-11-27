return {
	'declancm/cinnamon.nvim',
	config = function()
		require('cinnamon').setup({
			default_keymaps = true,
			default_delay = 10,
			horizontal_scroll = true,
		})
	end,
}
