set nocompatible
filetype off

" Vundle begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'sjl/badwolf'
Plugin 'rking/ag.vim'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Colors

if $TERM == "xterm-256color" || $TERM == "screen-256color"
  set t_Co=256
endif

syntax enable
colorscheme badwolf         " awesome colorscheme

" Tabs

set tabstop=2
set softtabstop=2
set expandtab
set wildmenu            " visual autocomplete for command menu

" Misc graphical stuff

set number
set showcmd
set cursorline

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Filetype detection, indentation

filetype indent on

" Search

set incsearch
set hlsearch
nnoremap <space> :nohlsearch<CR>

" Movement

" easier split navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

