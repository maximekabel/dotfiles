set nocompatible 	"You're not vi act like it
set number
syntax on
set tabstop=4		"Tabs turn into 4 space when opening file 
set expandtab ts=4 sw=4 ai "Tabs are 4 spaces
set expandtab		"Tabs become just 4 spaces
set cursorline		"Sets a horizontal line where the cursor is 
filetype indent on      " load filetype-specific indent files
set showmatch		"Highlight Matching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set clipboard+=unnamedplus "use + register for clipboard operations


call plug#begin()
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
highlight Normal ctermbg=NONE guibg=NONE
