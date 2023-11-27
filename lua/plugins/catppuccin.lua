return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	init = function()
		-- Any flavour for catppuccin it can be
		-- 'latte', 'frappe', 'macchiato' or 'mocha'.
		local flavour = flavour or 'macchiato'

		-- Catppuccin 'flavour' color palette.
		local palette = require('catppuccin.palettes').get_palette(flavour)

		-- Setup catppuccin theme.
		require('catppuccin').setup({
			flavour = flavour,
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
			integrations = {
				barbar = true,
				indent_blankline = {
					enabled = true,
					scope_color = '',
					colored_indent_levels = false,
				},
				cmp = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = {'italic'},
						hints = {'italic'},
						warnings = {'italic'},
						information = {'italic'},
					},
					inlay_hints = {
						background = true,
					},
				},
				nvimtree = true,
				treesitter = true,
				ufo = true,
				illuminate = {
					enabled = true,
					lsp = true,
				},
				which_key = true,
			},
			custom_highlights = {
				-- TODO: Add cursor custom highlights.

				-----------------------------------------------------
				-- LSP floating windows highlight settings. ---------
				NormalFloat = {bg = palette.base,},
				FloatBorder = {fg = palette.text, bg = palette.base,},
				-----------------------------------------------------
				-- NvimTree highlight settings. ---------------------
				NvimTreeCursorLine = {bg = palette.surface0,},
				NvimTreeGitDirty = {fg = palette.peach,}, -- Unstaged
				NvimTreeGitNew = {fg = palette.green,}, -- Untracked
				NvimTreeGitIgnored = {fg = palette.surface2,}, -- Ignored
				NvimTreeGitDeleted = {fg = palette.maroon,}, -- Deleted
				NvimTreeGitRenamed = {fg = palette.pink,}, -- Renamed
				NvimTreeGitStaged = {fg = palette.sky,}, -- Staged
				NvimTreeGitMerge = {fg = palette.mauve,}, -- Unmerged
				NvimTreeLiveFilterPrefix = {fg = palette.mauve, bg = palette.base, style = {'bold'},},
				-----------------------------------------------------
				-- NvimUFO highlight settings. ----------------------
				-- Folded lines indicator.
				MoreMsg = {fg = palette.green, style = {'italic'},},
				-- Folded line with cursor on it.
				UfoCursorLineFoldedLine = {bg = palette.surface0,},
				-- Folded line highlight.
				Folded = {bg = palette.crust,},
				-----------------------------------------------------
				-- Barbar highlight settings. -----------------------
				BufferCurrent = {fg = palette.text, bg = palette.base,},
				BufferCurrentSign = {fg = palette.mantle, bg = palette.blue,},
				BufferCurrentMod = {fg = palette.text, bg = palette.base, style = {'italic'},},
				BufferCurrentTarget = {bg = palette.base, style = {'bold'},},
				BufferInactive = {fg = palette.overlay0,},
				BufferInactiveSign = {fg = palette.surface0, bg = palette.mantle,},
				BufferInactiveMod = {fg = palette.overlay0, style = {'italic'},},
				BufferVisible = {fg = palette.text, bg = palette.base,},
				BufferVisibleSign = {fg = palette.mantle, bg = palette.blue,},
				BufferVisibleMod = {fg = palette.text, bg = palette.base, style = {'italic'},},
				BufferVisibleTarget = {bg = palette.base, style = {'bold'},},
				-----------------------------------------------------
				-- Lualina highlight settings. ----------------------
				LualineMode_n = {fg = palette.mantle, bg = palette.red, style = {'bold'},},
				LualineMode_i = {fg = palette.mantle, bg = palette.green, style = {'bold'},},
				LualineMode_v = {fg = palette.mantle, bg = palette.blue, style = {'bold'},},
				LualineMode_syn = {fg = palette.mantle, bg = palette.blue, style = {'bold'},},
				LualineMode_V = {fg = palette.mantle, bg = palette.blue, style = {'bold'},},
				LualineMode_c = {fg = palette.mantle, bg = palette.mauve, style = {'bold'},},
				LualineMode_no = {fg = palette.mantle, bg = palette.red, style = {'bold'},},
				LualineMode_s = {fg = palette.mantle, bg = palette.peach, style = {'bold'},},
				LualineMode_S = {fg = palette.mantle, bg = palette.peach, style = {'bold'},},
				LualineMode_oc3 = {fg = palette.mantle, bg = palette.peach, style = {'bold'},},
				LualineMode_ic = {fg = palette.mantle, bg = palette.yellow, style = {'bold'},},
				LualineMode_R = {fg = palette.mantle, bg = palette.pink, style = {'bold'},},
				LualineMode_Rv = {fg = palette.mantle, bg = palette.pink, style = {'bold'},},
				LualineMode_cv = {fg = palette.mantle, bg = palette.red, style = {'bold'},},
				LualineMode_ce = {fg = palette.mantle, bg = palette.red, style = {'bold'},},
				LualineMode_r = {fg = palette.mantle, bg = palette.sapphire, style = {'bold'},},
				LualineMode_rm = {fg = palette.mantle, bg = palette.sapphire, style = {'bold'},},
				LualineMode_rq = {fg = palette.mantle, bg = palette.sapphire, style = {'bold'},},
				LualineMode_e = {fg = palette.mantle, bg = palette.red, style = {'bold'},},
				LualineMode_t = {fg = palette.mantle, bg = palette.red, style = {'bold'},},
				LualineFileName = {fg = palette.mauve, bg = palette.mantle, style = {'bold'},},
				LualineProgress = {fg = palette.text, bg = palette.mantle, style = {'bold'},},
				LualineDiagnosticsError = {fg = palette.red, bg = palette.mantle,},
				LualineDiagnosticsWarn = {fg = palette.yellow, bg = palette.mantle,},
				LualineDiagnosticsInfo = {fg = palette.sapphire, bg = palette.mantle,},
				LualineLsp = {fg = palette.overlay0, bg = palette.mantle, style = {'bold'},},
				LualineBranch = {fg = palette.pink, bg = palette.mantle, style = {'bold'},},
				LualineDiffAdded = {fg = palette.green, bg = palette.mantle,},
				LualineDiffModified = {fg = palette.peach, bg = palette.mantle,},
				LualineDiffRemoved = {fg = palette.red, bg = palette.mantle,},
				LualineEncoding = {fg = palette.blue, bg = palette.mantle, style = {'bold'},},
				LualineFileFormat = {fg = palette.text, bg = palette.mantle, style = {'bold'},},
				-----------------------------------------------------
			},
		})
	end,
}
