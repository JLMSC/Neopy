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

			-- TODO: Add integrations.

			-- Custom colors for integrations, matching 'catppuccin' colorscheme colors.
			integrations = {
				-- Nvim CMP
				cmp = true,
				indent_blankline = {
					enabled = true,
					scope_color = '',
					colored_indent_levels = false,
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
						informations = {'underline'},
					},
					inlay_hints = {
						background = true,
					},
				},
				-- NvimTree
				nvimtree = true,
				-- NvimTreesitter
				treesitter = true,
				-- Which Key
				which_key = true,
			},

			-- TODO: Add custom highlights.
			-- TODO: Change NvimTree diagnostics highlights.

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
				}
			end,
			-- custom_highlights = function(colors) return { ... } end,
		})
    end,
}
