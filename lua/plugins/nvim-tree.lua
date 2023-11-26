return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('nvim-tree').setup({
			renderer = {
				icons = {
					glyphs = {
						git = {
							unstaged = "[~]",
							staged = "[S]",
							unmerged = "[C]",
							renamed = "[R]",
							untracked = "[+]",
							deleted = "[D]",
							ignored = "[◌]",
						},
					},
					git_placement = 'before',
					diagnostics_placement = 'before',
				},
				highlight_git = true,
				highlight_diagnostics = true,
				indent_markers = {
					enable = true
				},
			},
			filters = {
				custom = {
					'^.git$',
				},
			},
			diagnostics = {
				enable = true,
			},
		})

		-- Add NvimTree mapping to WhichKey.
		local wk = require('which-key')
		wk.register({
			['<leader>'] = {
				e = {
					name = '+NvimTree',
					e = {'<CMD>NvimTreeToggle<CR>', 'Toggle NvimTree'},
					f = {'<CMD>NvimTreeFocus<CR>', 'Open and Focus NvimTree'},
					g = {'', 'Use "g?" in NvimTree for help'},
				},
			},
		})
    end,
}
