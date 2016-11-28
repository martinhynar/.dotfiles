set nocompatible
set path+=**
set wildmenu


" Line numbers
set number
set numberwidth=6

" tabulators
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
  set backupdir=/tmp,.
  set directory=/tmp,.
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" TAGS
" Create 'tags' file
command! MakeTags !ctags -R .

" Now I can
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


filetype plugin indent on
syntax enable
set background=light
colorscheme solarized

" Highlight last searched pattern
set hlsearch

set autoindent		" always set autoindenting on


nmap <ESC> :w<CR>
nmap <C-i> gg<CR>=G<CR>
