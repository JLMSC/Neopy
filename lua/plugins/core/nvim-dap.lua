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
		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint"})
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "DapBreakpointCondition"})
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint"})
	end,
}
