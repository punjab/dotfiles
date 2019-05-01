set nocompatible                " choose no compatibility with legacy vi

let g:python_host_prog = '/usr/local/var/pyenv/versions/neovim/bin/python'
let g:python3_host_prog = '/usr/local/var/pyenv/shims/python'

"" Vim-plug is the Manager
call plug#begin('~/.config/nvim/plugged')
" Pandoc / Markdown
Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }

" General
Plug 'benekastah/neomake'
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Vim carried over
Plug 'mattn/emmet-vim'        " Emmet for web development
Plug 'bling/vim-airline'      " Airline status command
Plug 'rking/ag.vim'           " Better than grep
Plug 'dracula/vim'
call plug#end()

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set number                      " Set line number by default
set laststatus=2                " For airline to show up 

"" Whitespace
"set nowrap                      " don't wrap lines
set wrap linebreak nolist       " softwrap on
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start 	" backspace through everything in insert mode

"" Searching
"set hlsearch			              " highlight matches
set incsearch			              " incremental searching
set ignorecase			            " searches are cases insensitive
set smartcase			              " err..unles they contain atleast one cpaital letter.

"" Colors
color dracula
if has("gui_running")
  set background=dark
  set transparency=15
  set guioptions=aAce           " Get rid of those ugly scrollbars in mvim
  set guifont=Hack:h16   " Inconsolata looks good at 16pts
else
""  set background=dark
endif

"" Shortcuts
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

" Remap Emmet leader key to '
" let g:user_emmet_leader_key=','

" Automatic closing brackets
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" Setup JSX highlighing for .js files
let g:jsx_ext_required = 0

