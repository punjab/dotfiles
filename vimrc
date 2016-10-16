set nocompatible                " choose no compatibility with legacy vi

let g:python_host_prog = '/usr/local/var/pyenv/shims/python'
let g:python3_host_prog = '/usr/local/var/pyenv/shims/python'
let g:ycm_path_to_python_interpreter = '/usr/local/var/pyenv/shims/python'
" Use deoplete.
let g:deoplete#enable_at_startup = 1

"" Vundle is the Manager
filetype off                    " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " let Vundle manage Vundle, required!
Plugin 'kien/ctrlp.vim'         " Fuzzy buffer list files by Ctrl-P
Plugin 'mattn/emmet-vim'        " Emmet for web development
Plugin 'scrooloose/nerdtree'    " File sidebar
Plugin 'tpope/vim-fugitive'     " Awesome git integration
Plugin 'bling/vim-airline'      " Airline status command
Plugin 'vim-ruby/vim-ruby'      " Compile ruby in vim
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'     " HTML editing
Plugin 'rking/ag.vim'           " Better than grep
" Snipmate and dependencies
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'      " Perform all your vim insert mode completions with Tab
Plugin 'honza/vim-snippets'
""Plugin 'Valloric/YouCompleteMe' " Autocomplete
" React
Plugin 'mxw/vim-jsx'
Plugin 'punjab/vim-react-snippets'
call vundle#end()               " required by Vundle

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

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
colorscheme smyck
if has("gui_running")
  set background=dark
  set transparency=15
  set guioptions=aAce           " Get rid of those ugly scrollbars in mvim
  set guifont=Hack:h16   " Inconsolata looks good at 16pts
else
  set background=dark
endif

"" Shortcuts
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>") " Using tab instead of Ctrl-Y for emmet exapansion
map <C-n> :NERDTreeToggle<CR> " Toggle NerdTree

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Remap Emmet leader key to '
let g:user_emmet_leader_key=','

" Automatic closing brackets
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" Setup JSX highlighing for .js files
let g:jsx_ext_required = 0

