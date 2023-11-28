return {
	'neovim/nvim-lspconfig',
	config = function()
		-- Show line diagnostics automatically
		-- while in hover window.
		vim.o.updatetime = 100
		vim.api.nvim_create_autocmd('CursorHold', {
			buffer = bufnr,
			callback = function()
				local opts = {
					focusable = false,
					close_events = {'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost'},
					border = 'rounded',
					source = 'always',
					prefix = ' ',
					scope = 'cursor',
				}
				vim.diagnostic.open_float(nil, opts)
			end
		})

		-- Borders highlight for diagnostic
		-- floating window and handlers.
		local border = {
			{"🭽", "FloatBorder"},
			{"▔", "FloatBorder"},
			{"🭾", "FloatBorder"},
			{"▕", "FloatBorder"},
			{"🭿", "FloatBorder"},
			{"▁", "FloatBorder"},
			{"🭼", "FloatBorder"},
			{"▏", "FloatBorder"},
		}
		local handlers = {
			['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
			['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}),
		}
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		-- Change diagnostic symbols in the sign column.
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
		end

		-- Customize how diagnostics are displayed.
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = false,
		})

		-- Run lsp pyright setup.
		require('lspconfig').pyright.setup({handlers = handlers})
	end,
}
