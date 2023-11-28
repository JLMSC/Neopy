return {
	'rmagatti/auto-session',
	init = function()
		vim.o.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
	end,
	config = function()
		require('auto-session').setup({
			log_level = 'error',
			auto_session_enable_last_session = false,
			auto_session_enabled = true,
			auto_session_create_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_suppress_dirs = {'~/', '~/Projects', '~/Downloads', '/',},
			auto_session_allowed_dirs = {'~/.config/nvim', '~/Documents/Workspace',},
			auto_session_use_git_branch = true,
		})
	end,
}
