return {
	'kkoomen/vim-doge',
	build = ':call doge#install()',
	init = function()
		-- 'resT', 'numpy', 'google', 'sphinx', 'doxygen'
		vim.g.doge_doc_standard_python = 'numpy'
		vim.g.doge_enable_mappings = 0
	end,
}
