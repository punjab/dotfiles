call pathogen#infect()          " runtime manipulator plugin
set nocompatible                " choose no compatibility with legacy vi
call pathogen#infect()          " runtime manipulator plugin
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start 	" backspace through everything in insert mode

"" Searching
set hlsearch			              " highlight matches
set incsearch			              " incremental searching
set ignorecase			            " searches are cases insensitive
set smartcase			              " err..unles they contain atleast one cpaital letter.

"" Colors
colorscheme desert
if has("gui_running")
  set background=light
  set transparency=15
  set guioptions=aAce           " Get rid of those ugly scrollbars in mvim
  set guifont=Inconsolata:h16   " Inconsolata looks good at 16pts
else
  set background=dark
endif

