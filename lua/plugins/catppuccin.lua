return {
    'catppuccin/nvim',
    name = 'catppuccin',
    init = function()
		-- Catppuccin 'latte' colorscheme.
		local latte = require('catppuccin.palettes').get_palette('latte')

		require('catppuccin').setup({
			flavour = 'latte',
			background = {
				light = 'latte',
				dark = 'mocha',
			},
			transparent_background = false,
			show_end_of_buffer = true,
			term_colors = true,
			dim_inactive = {
				enabled = true,
				shade = 'dark',
				percentage = 0.75,
			},
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = {'italic'},
				conditionals = {'bold'},
				loops = {'bold'},
				functions = {'bold'},
				keywords = {'bold'},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {'bold'},
				properties = {'italic'},
				types = {'italic'},
				operators = {'bold'},
			},
			-- Custom colors for integrations, matching 'catppuccin' colorscheme colors.
			integrations = {
				-- Barbar
				barbar = true,
				-- Barbecue
				barbecue = {
					dim_dirname = true,
					bold_basename = true,
					dim_context = false,
					alt_background = false,
				},
				-- Dashboard
				dashboard = true,
				-- Indent Blankline
				indent_blankline = {
					enabled = true,
					scope_color = '',
					colored_indent_levels = false,
				},
				-- Nvim CMP
				cmp = true,
				-- Nvim DAP
				dap = {
					enabled = true,
					enable_ui = true,
				},
				-- Nvim LSP
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = {'italic'},
						hints = {'italic'},
						warnings = {'italic'},
						information = {'italic'},
					},
					underlines = {
						errors = {'underline'},
						hints = {'underline'},
						warnings = {'underline'},
						information = {'underline'},
					},
					inaly_hints = {
						background = true,
					},
				},
				-- Navic
				navic = {
					enabled = true,
					custom_bg = "NONE",
				},
				-- NvimTree
				nvimtree = true,
				-- NvimTreesitter
				treesitter = true,
				-- Telescope
				telescope = {
					enabled = true,
				},
				-- Vim Illuminate
				illuminate = {
					enabled = true,
					lsp = true,
				},
				-- Which Key
				which_key = true,
			},
			-- Custom highlights, making tweaks to match 'catppuccin' colorscheme.
			custom_highlights = function(colors)
				return {
					-----------------------------
					-- LSP Floating windows 
					NormalFloat = {
						bg = latte.base,
					},
					FloatBorder = {
						fg = latte.text,
						bg = latte.base,
					},
					-----------------------------
					-- Cursor
					Cursor = {
						fg = colors.black,
						bg = colors.black,
					},
					iCursor = {
						fg = colors.green,
						bg = colors.green,
					},
					CursorLine = {
						bg = latte.surface0,
					},
					CusorLineNr = {
						fg = latte.mauve,
						style = {'bold'},
					},
					-----------------------------
					-- WhichKey
					WhichKey = {
						style = {'bold'},
					},
					WhichKeyFloat = {
						bg = latte.crust,
					},
					-----------------------------
					-- NvimTree
					NvimTreeCursorLine = {
						bg = latte.surface0,
					},
					NvimTreeGitDirty = { -- Unstaged
						fg = latte.peach,
					},
					NvimTreeGitNew = { -- Untracked
						fg = latte.green,
					},
					NvimTreeGitIgnored = { -- Ignored
						fg = latte.surface2,
					},
					NvimTreeGitDeleted = { -- Deleted
						fg = latte.maroon,
					},
					NvimTreeGitRenamed = { -- Renamed
						fg = latte.pink,
					},
					NvimTreeGitStaged = { -- Staged
						fg = latte.sky,
					},
					NvimTreeGitMerge = { -- Unmerged
						fg = latte.mauve,
					},
					-----------------------------
					-- NvimUFO
					MoreMsg = { -- Folded lines indicator.
						fg = latte.green,
						style = {'italic'},
					},
					UfoCursorLineFoldedLine = { -- Folded line with cursor on it.
						bg = latte.surface0,
					},
					Folded = { -- Folded line highlight.
						bg = latte.mantle,
					},
					-----------------------------
					-- Barbar
					BufferCurrent = { -- Barbar CURRENT buffer.
						fg = latte.text,
						bg = latte.base,
					},
					BufferCurrentSign = { -- Barbar CURRENT separator between buffers.
						fg = latte.mantle,
						bg = latte.blue,
					},
					BufferCurrentMod = { -- Barbar CURRENT when modified.
						fg = latte.text,
						bg = latte.base,
						style = {'italic'},
					},
					BufferCurrentTarget = { -- Barbar CURRENT pick letter.
						bg = latte.base,
						style = {'bold'},
					},
					BufferInactive = { -- Barbar INACTIVE buffer.
						fg = latte.overlay0,
					},
					BufferInactiveSign = { -- Barbar INACTIVE separator between buffers.
						fg = latte.surface0,
						bg = latte.mantle,
					},
					BufferInactiveMod = { -- Barbar INACTIVE when modified.
						fg = latte.overlay0,
						style = {'italic'},
					},
					BufferVisible = { -- Barbar VISIBLE buffer.
						fg = latte.text,
						bg = latte.base,
					},
					BufferVisibleSign = { -- Barbar VISIBLE separator between buffers.
						fg = latte.mantle,
						bg = latte.blue,
					},
					BufferVisibleMod = { -- Barbar VISIBLE when modified.
						fg = latte.text,
						bg = latte.base,
						style = {'italic'},
					},
					BufferVisibleTarget = { -- Barbar VISIBLE pick letter.
						bg = latte.base,
						style = {'bold'},
					},
					-----------------------------
					-- Dashboard
					DashboardLazy = { -- Dashboard 'Lazy update' highlight.
						fg = latte.sky,
						style = {'bold'},
					},
					DashboardOpenFile = { -- Dashboard 'Open file' highlight.
						fg = latte.yellow,
						style = {'bold'},
					},
					DashboardTerminal = { -- Dashboard 'Terminal' highlight.
						fg = latte.subtext0,
						style = {'bold'},
					},
					DashboardHealth = { -- Dashboard 'Check Health' highlight.
						fg = latte.green,
						style = {'bold'},
					},
					DashboardPlugins = { -- Dashboard 'Plugins' highlight.
						fg = latte.mauve,
						style = {'bold'},
					},
					DashboardExit = { -- Dashboard 'Quit' highlight.
						fg = latte.maroon,
						style = {'bold'},
					},
					-----------------------------
				}
			end,
			-- custom_highlights = function(colors) return { ... } end,
		})
    end,
}
