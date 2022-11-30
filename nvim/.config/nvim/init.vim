syntax on

set background=dark
set termguicolors

set number
set numberwidth=4
set encoding=UTF-8

set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set smartindent
set shiftwidth=4
set mouse=a

set incsearch
set nohlsearch

set ignorecase
set smartcase

set splitright
set splitbelow

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua' "ctrl-N
Plug 'neoclide/coc.nvim', {'branch':'release','do': 'yarn install --frozen-lockfile'}
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/tagbar' "F8
Plug 'cjrh/vim-conda'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'

call plug#end()

set t_Co=256
colorscheme minimalist

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

nmap <F8> :TagbarToggle<CR>

let g:nvim_tree_git_hl = 1 
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_create_in_closed_folder = 1 
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } 
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-json',
			\ 'coc-rome',
			\ 'coc-texlab',
			\ 'coc-julia',
			\ 'coc-html',
			\ 'coc-clangd',
			\ 'coc-sh',
			\ 'coc-markdownlint',
			\ 'coc-jedi',
			\ ]

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

highlight NvimTreeFolderIcon guibg=gray

lua require 'nvim-tree-config'

lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'/mnt/e/Polymathy/Writing/blog/org/*'},
  org_default_notes_file = '/mnt/e/Polymathy/Writing/blog/org/notes.org',
})
EOF
