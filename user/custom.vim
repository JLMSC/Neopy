" Set encoding to UTF-8.
set encoding=utf-8
" Enable cursorline.
set cursorline
" Enable hybrid numbers.
set nu! rnu!
" Enable signcolumn.
set signcolumn
" Max line above and below cursor.
set scrolloff=10
" Disable word wrap
set nowrap
" Disable backups.
set nobackup
set nowritebackup
" Enable autoread file changes.
set updatetime=100
set autoread
" Change new splits directions.
set splitright
set splitbelow
" Enable mouse support.
set mouse=a
" Enable use for both unnamed and unnamedplus.
set clipboard=unnamed,unnamedplus
" Enable incremental search and ignore case.
set incsearch
set ignorecase
" Buffers.
set hidden
set guioptions-=e
set sessionoptions+=tabpages,globals
" Enable filetype support.
filetype on
filetype plugin on
filetype indent on
" Change cursor format and highlight groups.
set guicursor=n-v-c:block-Cursor
set guicursor+=i:hor50-iCursor
set guicursor+=n-v-c:blinkon1
set guicursor+=i:blinkon1
" Global indent.
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Enable yank highlight.
autocmd TextYankPost * silent! lua vim.highlight.on_yank{on_visual=false}
" Disable auto comment.
autocmd BufEnter * set formatoptions-=cro
