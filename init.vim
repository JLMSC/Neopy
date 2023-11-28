" Disable NETRW.
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1


" Map <LEADER> to <SPACE>.
let g:mapleader=' '


" Setup Lazy.nvim if needed.
runtime lua/lazy-initial-config.lua

" Plugins and settings.
" TODO: Add some sort of Markdown preview.
lua require('lazy').setup('plugins')


" Custom Neovim settings.
runtime user/custom.vim


" Set colorscheme to 'catppuccin'.
colorscheme catppuccin
