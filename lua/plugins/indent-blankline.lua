return {
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	opts = {
		exclude = {
			filetypes = {
				'lspinfo',
				'packer',
				'lazy',
				'checkhealth',
				'help',
				'man',
				'gitcommit',
				'TelescopePrompt',
				'TelescopeResults',
				'dashboard',
				'',
			},
		},
		scope = {
			enabled = false,
		},
	},
}
