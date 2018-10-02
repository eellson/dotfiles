" vim:fdm=marker:fen:fdl=0
""""" PLUGINS {{{1

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'airblade/vim-gitgutter'         " git indicators in gutter
Plug 'benmills/vimux'                 " tmux integration
Plug 'elixir-lang/vim-elixir'         " elixir
Plug 'embear/vim-localvimrc'          " local vimrc files
Plug 'janko-m/vim-test'               " test wrapper
Plug 'joshdick/onedark.vim'           " onedark colourscheme
Plug 'neomake/neomake'                " neomake for linting etc
Plug 'sheerun/vim-polyglot'           " language packs
Plug 'tpope/vim-commentary'           " better commenting
Plug 'tpope/vim-fugitive'             " git plugin
Plug 'tpope/vim-rails'                " rails plugin
Plug 'tpope/vim-vinegar'              " netrw sensible defaults
Plug 'rking/ag.vim'                   " silver searcher
Plug 'sjl/badwolf'
Plug 'slashmili/alchemist.vim'        " alchemist-server integration for mix projects
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" deoplete:
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Add plugins to &runtimepath
call plug#end()

""" Plugin config

""" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Run test command in docker web container
function! DockerWebTransform(cmd) abort
  return 'docker-compose run web '.a:cmd
endfunction

let test#strategy = 'vimux' " use vimux test strategy
let g:test#custom_transformations = {'docker': function('DockerWebTransform')}

""" vim-localvimrc
let g:localvimrc_whitelist = [
      \'/Users/ed/Projects/snapetto/.lvimrc',
      \'/Users/ed/Projects/lifegoals/.lvimrc',
      \'/Users/ed/Projects/team_minted/.lvimrc'
      \]

""" vimux
map <Leader>z :VimuxZoomRunner<CR> " zoom vimux pane

""" neomake
" function! MyOnBattery()
"   return readfile('/sys/class/power_supply/AC/online') == ['0']
" endfunction

" if MyOnBattery()
"   call neomake#configure#automake('w')
" else
call neomake#configure#automake('nw', 1000)
" endif

" better credo handling as-per https://github.com/neomake/neomake/pull/300#issuecomment-244722296
let g:neomake_elixir_enabled_makers = ['mix', 'credo']
" function NeomakeCredoErrorType(entry)
"   if a:entry.type ==# 'F'      " Refactoring opportunities
"     let type = 'W'
"   elseif a:entry.type ==# 'D'  " Software design suggestions
"     let type = 'I'
"   elseif a:entry.type ==# 'W'  " Warnings
"     let type = 'W'
"   elseif a:entry.type ==# 'R'  " Readability suggestions
"     let type = 'I'
"   elseif a:entry.type ==# 'C'  " Convention violation
"     let type = 'W'
"   else
"     let type = 'M'           " Everything else is a message
"   endif
"   let a:entry.type = type
" endfunction

" let g:neomake_elixir_mycredo_maker = {
"       \ 'exe': 'mix',
"       \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
"       \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
"       \ 'postprocess': function('NeomakeCredoErrorType')
"       \ }

""" deoplete
let g:deoplete#enable_at_startup = 1

""" gist
let g:gist_post_private = 1

""" elm
let g:elm_format_autosave = 1

""" elixir formatter on save (hopefully will be integrated with plugin soon!
autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format %

""""" BEHAVIOUR {{{1

""" Splits
set splitbelow " new split opens below
set splitright " new split opens right

""" Tabs
set expandtab    " expand tabs into spaces
set tabstop=2    " use 2 spaces for tab in insert mode
set shiftwidth=2 " use 2 columns for <</>>

""" Search
nnoremap <space> :nohlsearch<CR> " rm search highlight on <space>
set ignorecase                   " ignore case when searching
set smartcase                    " use case when searching if given uppercase in term

""" Undo
set undofile                " persistent undo
set undodir=$HOME/.vim/undo " must create this dir
set undolevels=1000         " set undo history
set undoreload=10000        " set lines to save for undo

""" Write/Quit
command! WQ wq " WQ = wq
command! Wq wq " Wq = wq
command! W w   " W = w
command! Q q   " Q = q

""" Buffers
set hidden " allow hidden buffers

""" Temp(?) fix for sierra system clipboard
set clipboard=unnamed

""" Temp files

set backupdir=~/.vim/backup_files// " directory for backup files
set directory=~/.vim/swap_files//   " directory for swap files
set undodir=~/.vim/undo_files//     " directory for undo files

""" truecolor/italics
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

""""" MOVEMENT {{{1

""" Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

""""" AESTHETICS {{{1

""" UI
if exists('+colorcolumn')
  set colorcolumn=80       " highlight column 80
end
set cursorline             " highlight current line
set list listchars=trail:· " use · to indicate trailing chars
set number                 " show current line number
set relativenumber         " relative line numbers
set showcmd                " show current command in status line

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

""" Fix for cursor when running under tmux
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

""" Enable syntax highlighting in markdown blocks
let g:markdown_fenced_languages = [
      \'coffee',
      \'css',
      \'javascript',
      \'js=javascript',
      \'json=javascript',
      \'ruby',
      \'sass',
      \'xml',
      \'html',
      \'elixir'
      \]
