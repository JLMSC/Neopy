return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
		vim.o.timeoutlen = 1000

		-- TODO: Fix, doc those funcs below.
		-- TODO: Review this func.
		-- FIXME: it would be cool to close the splits instead of buffers.
		function CloseWindowOrBuffer()
			-- If focused window has 'NvimTree' in its name, use NvimTreeToggle.
			if vim.fn.stridx(vim.fn.bufname('%'), 'NvimTree') == 0 then
				-- NvimTree toggle command.
				vim.cmd('NvimTreeToggle')
			-- If more than one buffer are open, close the current buffer.
			elseif #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val)') > 1 then
				-- Barbar bufferclose command.
				vim.cmd('BufferClose')
			-- Otherwise, just show Dashboard.
			else
				-- Show dashboard.
				-- TODO: Maybe I'll change the Dashboard, idk.
				vim.cmd('Dashboard')
			end
		end


		-- TODO: Simple workaround to add something to watches
		-- Need to make it by selection instead of yanks.
		function AddYankToWatches()
			local yanked_text = vim.fn.getreg('"')
			local cleaned_yank = string.match(yanked_text, '^%s*(.-)%s*$')
			dapui.elements.watches.add(cleaned_yank)
		end


		-- Add mappings to which-key
		require('which-key').register({
			['<leader>'] = {
				-- Barbar mappings.
				['b'] = {name = '+Barbar',
					['b'] = {'<CMD>BufferPrevious<CR>', 'Go to previous buffer.'},
					['n'] = {'<CMD>BufferNext<CR>', 'Go to next buffer.'},
					['q'] = {'<CMD>BufferClose<CR>', 'Close current buffer.'},
					['p'] = {'<CMD>BufferPin<CR>', 'Toggle pin in current buffer.'},
					['r'] = {'<CMD>BufferRestore<CR>', 'Restore buffer.'},
					['h'] = {'<CMD>BufferPick<CR>', 'Go to buffer by its pick letter.'},
					['d'] = {'<CMD>BufferPickDelete<CR>', 'Delete buffer by its pick letter.'},
				},
				-- Dap and Dap-UI mappings.
				-- warn: it's missing persistent-breakpoints plugin.
				-- warn: goto-breakpoints is missing too.
				['d'] = {name = '+DAP',
					['c'] = {'<CMD>DapContinue<CR>', 'Start/Continue DAP session.'},
					['q'] = {'<CMD>DapTerminate<CR>', 'Terminate DAP session.'},
					['b'] = {'<CMD>lua require("persistent-breakpoints.api").toggle_breakpoint()<CR>', 'Toggle breakpoint on cursor.'},
					['r'] = {'<CMD>DapToggleRepl<CR>', 'Toggle Repl.'},
					['n'] = {'<CMD>lua require("goto-breakpoints").prev()<CR>', 'Go to previous breakpoint.'},
					['v'] = {'<CMD>lua require("goto-breakpoints").next()<CR>', 'Go to next breakpoint.'},
					['s'] = {'<CMD>lua require("goto-breakpoints").stopped()<CR>', 'Go to current active breakpoint.'},
					['t'] = {'<CMD>lua require("dapui").toggle()<CR>', 'Toggle DAP UI.'},
					['w'] = {'<CMD>lua AddYankToWatches()<CR>', 'Add yank to watches.'},
					['k'] = {'<CMD>lua require("dapui").open({reset=true})<CR>', 'Reset DAP UI size.'},
				},
				-- Gitsigns mappings.
				['g'] = {name = '+Gitsigns',
					['p'] = {'<CMD>Gitsigns toggle_current_line_blame<CR>', 'Toggle current line blame.'},
					['d'] = {'<CMD>Gitsigns diffthis ~1 vertical=true split="rightbelow"<CR>', 'Show current file diffs.'},
					['b'] = {'<CMD>Gitsigns prev_hunk<CR>', 'Go to previous hunk.'},
					['n'] = {'<CMD>Gitsigns next_hunk<CR>', 'Go to next hunk.'},
					['l'] = {'<CMD>Gitsigns preview_hunk_inline<CR>', 'Preview hunk inline.'},
					['L'] = {'<CMD>Gitsigns preview_hunk<CR>', 'Preview hunk.'},
				},
				-- NvimCMP mappings.
				-- fixme: those maps are defined in nvim-cmp.lua, move it here?
				['c'] = {name = '+NvimCMP',
					['<C-g>'] = {'', 'Toggle completion docs.'},
					['<C-b>'] = {'', 'Move 4 lines above in completion docs.'},
					['<C-n>'] = {'', 'Move 4 lines below in completion docs.'},
					['<Tab>'] = {'', 'Move to next completion.'},
					['<S-Tab>'] = {'', 'Move to previous completion.'},
					['<C-Space>'] = {'', 'Invoke completion.'},
					['<CR>'] = {'', 'Accept current completion.'},
				},
				-- NvimTree mappings.
				['e'] = {name = '+NvimTree',
					['e'] = {'<CMD>NvimTreeToggle<CR>', 'Toggle NvimTree.'},
					['f'] = {'<CMD>NvimTreeFocus<CR>', 'Open and/or Focus NvimTree.'},
					['g'] = {'', 'Use "g?" while in NvimTree for help.'},
				},
				-- Lazy mappings.
				['L'] = {name = '+Lazy',
					['i'] = {'<CMD>Lazy home<CR>', 'Show installed plugins.'},
					['s'] = {'<CMD>Lazy sync<CR>', 'Run install, clean and update.'},
					['u'] = {'<CMD>Lazy update<CR>', 'Update plugins.'},
					['c'] = {'<CMD>Lazy clean<CR>', 'Clean missing plugins.'},
					['h'] = {'checkhealth lazy<CR>', 'Check Lazy health.'},
				},
				-- ToggleTerm mappings.
				['T'] = {'<CMD>ToggleTerm direction=float<CR>', 'Open terminal.'},
				-- Todo-Comments mappings.
				['p'] = {name = '+TodoComments',
					['o'] = {'<CMD>TodoQuickFix<CR>', 'Search all TODOs in project.'},
					['b'] = {'<CMD>lua require("todo-comments").jump_prev()<CR>', 'Go to previous TODO.'},
					['n'] = {'<CMD>lua require("todo-comments").jump_next()<CR>', 'Go to next TODO.'},
				},
				-- NvimUFO mappings.
				['z'] = {name = '+NvimUFO',
					['r'] = {'zr', 'Open folds, except kinds.'},
					['m'] = {'zm', 'Close folds.'},
					['R'] = {'zR', 'Open all folds.'},
					['M'] = {'zM', 'Close all folds.'},
					['c'] = {'zc', 'Close one fold under the cursor.'},
					['C'] = {'zC', 'Close one fold under the cursor recursively.'},
					['o'] = {'zo', 'Open one fold under the cursor.'},
					['O'] = {'zO', 'Open one fold under the cursor recursively.'},
				},
				-- Save and close mappings.
				w = {'<CMD>w<CR>', 'Save current file/buffer'},
				q = {'<CMD>lua CloseWindowOrBuffer()<CR>', 'Close current window/buffer'},
				-- Split movement mappings.
				h = {'<C-W>h', 'Focus left split'},
				l = {'<C-W>l', 'Focus right split'},
				j = {'<C-W>j', 'Focus split below'},
				k = {'<C-W>k', 'Focus split above'},
			},
		})
    end,
}
