return {
    'rcarriga/nvim-dap-ui',
    dependencies = {'mfussenegger/nvim-dap'},
	config = function()
		local dapui = require('dapui')
		dapui.setup({
			layouts = {
				{
					elements = {
						{
							id = 'scopes',
							size = 0.25,
						},
						{
							id = 'watches',
							size = 0.25,
						},
						{
							id = 'breakpoints',
							size = 0.25,
						},
						{
							id = 'stacks',
							size = 0.25,
						},
					},
					position = 'left',
					size = 40,
				},
				{
					elements = {
						{
							id = 'repl',
							size = 1.0,
						},
					},
					position = 'bottom',
					size = 10,
				},
			},
		})

		function AddYankToWatches()
			local yanked_text = vim.fn.getreg('"')
			local cleaned_yank = string.match(yanked_text, '^%s*(.-)%s*$')
			dapui.elements.watches.add(cleaned_yank)
		end

		-- Add DAP UI mappings to WhichKey.
		local wk = require('which-key')
		wk.register({
			['<leader>dt'] = {'<CMD>lua require("dapui").toggle()<CR>', 'Toggle DAP UI'},
			['<leader>dw'] = {'<CMD>lua AddYankToWatches()<CR>', 'Add yank to watches'},
			['<leader>dk'] = {'<CMD>lua require("dapui").open({reset = true})<CR>', 'Reset DAP UI size'},
		})
	end,
}
