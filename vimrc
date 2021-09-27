set nocompatible                " choose no compatibility with legacy vi
set encoding=UTF-8
"" Vim-plug is the Manager
call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'dracula/vim'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

"" Colors
syntax enable			          " Enable syntax highlighting
colorscheme dracula
set guifont=Hack_Nerd_Font:h16

"" Syntax highlight using coc.nvim
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Nerdtree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"" Integrted terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"" Move between panels
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"" fzf file search settings
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" and ignore node_modules while searching
" and use silver_searcher installed using brew as search tool
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Legacy
filetype on           		" Enable filetype detection
filetype indent on    		" Enable filetype-specific indenting
filetype plugin on    		" Enable filetype-specific plugins

set showcmd                     " display incomplete commands
set number                      " Set line number by default
set laststatus=2                " For airline to show up 

"" Whitespace
"set nowrap                     " don't wrap lines
set wrap linebreak nolist       " softwrap on
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start 	" backspace through everything in insert mode

"" Searching
"set hlsearch			" highlight matches
set incsearch			" incremental searching
set ignorecase			" searches are cases insensitive
set smartcase			" err..unles they contain atleast one cpaital letter.

" Automatic closing brackets
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

