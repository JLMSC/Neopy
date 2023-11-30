return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	dependencies = {'nvim-tree/nvim-web-devicons'},
	config = function()
		require('dashboard').setup({
            theme = 'hyper',
			shortcut_type = 'number',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = ' Update',
                        group = 'DashboardLazy',
                        action = 'Lazy update',
                        key = 'u',
                    },
                    {
                        desc = ' Open file',
                        group = 'DashboardOpenFile',
                        action = 'NvimTreeFindFile',
                        key = 'f',
                    },
                    {
                        desc = ' Terminal',
                        group = 'DashboardTerminal',
                        action = 'ToggleTerm direction=float',
                        key = 't',
                    },
                    {
                        desc = ' Check Health',
                        group = 'DashboardHealth',
                        action = 'checkhealth',
                        key = 'h',
                    },
                    {
                        desc = ' Plugins',
                        group = 'DashboardPlugins',
                        action = 'Lazy show',
                        key = 'L',
                    },
                    {
                        desc = ' Exit',
                        group = 'DashboardExit',
                        action = 'q!',
                        key = 'q',
                    },
                },
                project = {
                    enable = false,
                },
                mru = {
                    limit = 3,
                    cwd_only = true,
                },
            },
		})
	end,
}
