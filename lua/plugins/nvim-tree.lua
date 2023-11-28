return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('nvim-tree').setup({
			view = {
				adaptive_size = true,
			},
			live_filter = {
				prefix = '[FILTER]: ',
				always_show_folders = false,
			},
			renderer = {
				icons = {
					webdev_colors = true,
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "󰦺",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "➜",
							untracked = "",
							deleted = "",
							ignored = "◌",
						},
					},
					git_placement = 'before',
					diagnostics_placement = 'after',
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
				show_on_dirs = false,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
		})

		-- Add NvimTree mappings to WhichKey.
		-- TODO: Move to which-key.lua
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
