return {
	'mfussenegger/nvim-dap',
	config = function()
        local dap = require('dap')
		-- FIXME: Wrong cwd here.
        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = 'Debug file',
                program = '${file}',
                pythonPath = '/usr/bin/python3',
            }
        }
        dap.adapters.python = {
            type = 'executable',
            command = 'python3',
            args = { '-m', 'debugpy.adapter' },
        }
		
		-- Custom dap signs.
		local sign = vim.fn.sign_define
		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

		-- Add DAP mappings to WhichKey.
		-- TODO: Move to which-key.lua
		local wk = require('which-key')
		wk.register({
			['<leader>'] = {
				d = {
					name = '+DAP',
					c = {'<CMD>DapContinue<CR>', 'Start/Continue DAP session'},
					q = {'<CMD>DapTerminate<CR>', 'Terminate DAP session'},
					b = {'<CMD>lua require("persistent-breakpoints.api").toggle_breakpoint()<CR>', 'Toggle breakpoint on cursor'},
					r = {'<CMD>DapToggleRepl<CR>', 'Toggle repl'},
					v = {'<CMD>lua require("goto-breakpoints").next()<CR>', 'Go to next breakpoint'},
					n = {'<CMD>lua require("goto-breakpoints").prev()<CR>', 'Go to previous breakpoint'},
					s = {'<CMD>lua require("goto-breakpoints").stopped()<CR>', 'Go to current breakpoint'},
				},
			},
		})
	end,
}
