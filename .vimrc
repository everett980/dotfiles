execute pathogen#infect()
syntax on
filetype plugin indent on

" LEADER
let mapleader=","       " leader is comma

" UNDO
" TODO: consider gundo.vim, leader + u = easy access

" SYNTAX HIGHLIGHTING
syntax enable		" different than on ?
colorscheme molokai         " popular color scheme, TODO: too blue?

" UI CONFIG
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" TABS
set tabstop=2       " number of visual spaces per TAB in saved file
set softtabstop=2   " number of spaces in tab when editing (on TAB press, delete indetation, etc)
set shiftwidth=2    " number of spaces used by =, new line
set expandtab       " tabs are spaces

" SEARCH
" BUILTIN
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" CTRLP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " use ag to find files
" <leader>p to fuzzy search files
nnoremap <leader>p :CtrlP<CR>
" ACK
if executable('ag') " use ag instead of ack to find matches
  let g:ackprg = 'ag --vimgrep'
endif

" TMUX
" allows cursor change in tmux mode
" TODO: Fix?
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" BACKUP
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" NAVIGATION
" leader direction instead of ctrl+w direction
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" move vertically by visual line in the event of line wrap
nnoremap j gj
nnoremap k gk
