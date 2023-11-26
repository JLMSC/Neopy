" Disable NETRW.
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1


" Map <LEADER> to <SPACE>.
let g:mapleader=' '


" Setup Lazy.nvim if needed.
runtime lua/lazy-initial-config.lua

" TODO: LSP for python, lua and vim?
" Plugins and settings.
lua require('lazy').setup('plugins')


" Custom Neovim settings.
runtime user/custom.vim


" Set colorscheme to 'catppuccin'.
colorscheme catppuccin
