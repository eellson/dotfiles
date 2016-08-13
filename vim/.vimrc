""""" PLUGINS

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'airblade/vim-gitgutter' " git indicators in gutter
Plug 'joshdick/onedark.vim' " onedark colourscheme
Plug 'sheerun/vim-polyglot' " language packs
Plug 'tpope/vim-fugitive' " git plugin
Plug 'tpope/vim-rails' " rails plugin
Plug 'sjl/badwolf'

" Add plugins to &runtimepath
call plug#end()

""""" BEHAVIOUR

""" Splits
set splitbelow " new split opens below
set splitright " new split opens right

""" Tabs
set shiftwidth=2 " use 2 columns for <</>>
set softtabstop=2 " use 2 spaces for tab in insert mode

""" Search
nnoremap <space> :nohlsearch<CR> " rm search highlight on <space>

""" Undo
set undofile " persistent undo
set undodir=$HOME/.vim/undo " must create this dir
set undolevels=1000 " set undo history
set undoreload=10000 " set lines to save for undo

""""" MOVEMENT

""" Better split navigation
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <Silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>

""""" AESTHETICS

""" UI
if exists('+colorcolumn')
  set colorcolumn=80 " highlight column 80
end
set cursorline " highlight current line
set number " show current line number
set relativenumber " relative line numbers
set showcmd " show current command in status line

""" Use 24-bit colours
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

""" Colourscheme
syntax on " syntax highlight

let g:onedark_terminal_italics=1
colorscheme onedark
