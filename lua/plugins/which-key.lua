return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
		vim.o.timeoutlen = 1000

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
				vim.cmd('Dashboard')
			end
		end

		-- Add Lazy and custom mapping to which key.
		local wk = require('which-key')
		wk.register({
			['<leader>'] = {
				-- Lazy mappings.
				L = {
					name = '+Lazy',
					i = {'<CMD>Lazy home<CR>', 'Show installed plugins'},
					s = {'<CMD>Lazy sync<CR>', 'Run install, clean and update'},
					u = {'<CMD>Lazy update<CR>', 'Update plugins'},
					c = {'<CMD>Lazy clean<CR>', 'Clean missing plugins'},
					h = {'checkhealth lazy<CR>', 'Check Lazy health'},
				},
				-- Save and close mappings.
				w = {'<CMD>w<CR>', 'Save current file/buffer'},
				q = {'<CMD>lua CloseWindowOrBuffer()<CR>', 'Close current window/buffer'},
				-- Split movement mappings.
				h = {'<C-W>h', 'Focus left split'},
				l = {'<C-W>l', 'Focus right split'},
				j = {'<C-W>j', 'Focus split below'},
				k = {'<C-W>k', 'Focus split above'},
				-- Split mappings.
				v = {'<CMD>vs<CR>', 'Vertical split current window/buffer'},
				s = {'<CMD>sp<CR>', 'Horizontal split current window/buffer'},
			},
		})
    end,
}
