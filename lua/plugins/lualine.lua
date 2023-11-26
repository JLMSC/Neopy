return {
	'nvim-lualine/lualine.nvim',
	dependencies = {'nvim-tree/nvim-web-devicons'},
	opts = true,
	config = function()
        local lualine = require('lualine')
		local latte = require('catppuccin.palettes').get_palette('latte')
        local colors = {
			bg = latte.overlay0,
			fg = latte.text,
			yellow = latte.yellow,
			cyan = latte.sapphire,
			darkblue = latte.lavender,
			green = latte.green,
			orange = latte.peach,
			violet = latte.pink,
			magenta = latte.mauve,
			blue = latte.blue,
			red = latte.red,
			white = latte.surface0,
        }

        local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand('%:p:h')
				local gitdir = vim.fn.finddir('.git', filepath .. ';')
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
        }

        local config = {
			options = {
	            component_separators = '',
			    section_separators = '',
				theme = 'catppuccin',
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			extensions = {
				'toggleterm',
				'nvim-tree',
				'nvim-dap-ui',
				'symbols-outline',
				'trouble',
			},
        }

        local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
        end

        local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
        end

		-- Vim mode.
        ins_left {
			'mode',
			color = function()
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					['␖'] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					['␓'] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					['r?'] = colors.cyan,
					['!'] = colors.red,
					t = colors.red,
				}
				return { fg = colors.white, bg = mode_color[vim.fn.mode()], gui='bold' }
			end,
			padding = { left = 1, right = 1 },
        }

		-- Current file/buffer icon.
        ins_left {
			'filetype',
			colored = true,
			icon_only = true,
			padding = { left = 1, right = 0},
        }

		-- Current file/buffer name.
        ins_left {
			'filename',
			cond = conditions.buffer_not_empty,
			path = 1,
			color = { fg = colors.magenta, gui = 'bold' },
        }

		-- Current file/buffer progress.
        ins_left {
            'progress',
            color = { fg = colors.fg, gui = 'bold' },
            padding = { left = 1 },
        }

		-- Current file/buffer diagnostics.
        ins_left {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			symbols = { error = ' ', warn = ' ', info = ' ' },
			diagnostics_color = {
				color_error = { fg = colors.red },
				color_warn = { fg = colors.yellow },
				color_info = { fg = colors.cyan },
			},
        }

		-- Blank space.
        ins_left {
			function()
				return '%='
			end,
        }

		-- LSP server name.
        ins_left {
			function()
				local msg = 'No Active Lsp'
				local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = ' LSP:',
			color = { fg = colors.white, gui = 'bold' },
        }

		-- Current branch name.
        ins_right {
			'branch',
			icon = '',
			color = { fg = colors.violet, gui = 'bold' },
        }

			
		-- Git changes in current file/icon.
        ins_right {
			'diff',
			symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
        }

        -- Current encoding.
        ins_right {
			'o:encoding',
			fmt = string.upper,
			cond = conditions.hide_in_width,
			color = { fg = colors.blue, gui = 'bold' },
        }

		-- Operating System.
        ins_right {
          'fileformat',
          fmt = string.upper,
          icons_enabled = true,
          color = { fg = colors.fg, gui = 'bold' },
        }

        lualine.setup(config)
	end,
}
