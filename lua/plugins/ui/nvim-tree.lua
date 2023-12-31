return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('nvim-tree').setup({
			view = {
				adaptive_size = true,
			},
			-- FIXME: This should expand files in folder while in search.
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
	end,
}
