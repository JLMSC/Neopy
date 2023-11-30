return {
	'nvim-lualine/lualine.nvim',
	dependencies = {'nvim-tree/nvim-web-devicons'},
	opts = true,
	config = function()
		local lualine = require('lualine')
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
				globalstatus = true,
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
			},
		}

		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left {
			'mode',
			color = function()
				local mode_color = {
					n = 'LualineMode_n',
					i = 'LualineMode_i',
					v = 'LualineMode_v',
					['␖'] = 'LualineMode_syn',
					V = 'LualineMode_V',
					c = 'LualineMode_c',
					no = 'LualineMode_no',
					s = 'LualineMode_s',
					S = 'LualineMode_S',
					['␓'] = 'LualineMode_oc3',
					ic = 'LualineMode_ic',
					R = 'LualineMode_R',
					Rv = 'LualineMode_Rv',
					cv = 'LualineMode_cv',
					ce = 'LualineMode_ce',
					r = 'LualineMode_r',
					rm = 'LualineMode_rm',
					['r?'] = 'LualineMode_rq',
					['!'] = 'LualineMode_e',
					t = 'LualineMode_t',
				}
				return mode_color[vim.fn.mode()]
			end,
			padding = { left = 1, right = 1 },
        }

		ins_left {
			'filetype',
			colored = true,
			icon_only = true,
			padding = { left = 1, right = 0},
        }

        ins_left {
			'filename',
			cond = conditions.buffer_not_empty,
			path = 1,
			color = 'LualineFileName',
        }

        ins_left {
            'progress',
			color = 'LualineProgress',
            padding = { left = 1 },
        }

        ins_left {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			symbols = { error = ' ', warn = ' ', info = ' ' },
			diagnostics_color = {
				color_error = 'LualineDiagnosticsError',
				color_warn = 'LualineDiagnosticsWarn',
				color_info = 'LualineDiagnosticsInfo',
			},
        }

        ins_left {
			function()
				return '%='
			end,
        }

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
			color = 'LualineLsp',
        }

        ins_right {
			'branch',
			icon = '',
			color = 'LualineBranch',
        }

        ins_right {
			'diff',
			symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
			diff_color = {
				added = 'LualineDiffAdded',
				modified = 'LualineDiffModified',
				removed = 'LualineDiffRemoved',
			},
			cond = conditions.hide_in_width,
        }

        ins_right {
			'o:encoding',
			fmt = string.upper,
			cond = conditions.hide_in_width,
			color = 'LualineEncoding',
        }

        ins_right {
			'fileformat',
			fmt = string.upper,
			icons_enabled = true,
			color = 'LualineFileFormat',
        }

        lualine.setup(config)
	end,
}
