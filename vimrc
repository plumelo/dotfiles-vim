" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

runtime config/plugins.vim

filetype plugin indent on

NeoBundleCheck

syntax on
colorscheme monokai

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  set encoding=utf-8
endif

scriptencoding utf-8
set guioptions-=M

set ignorecase smartcase incsearch hlsearch
set shiftround softtabstop=-1 shiftwidth=0 tabstop=2 expandtab
set autoindent copyindent preserveindent smartindent
set backspace=indent,eol,start whichwrap=b,s,<,>,[,] nostartofline
set list listchars=tab:▸\ ,trail:.
set sidescroll=1 sidescrolloff=1 cursorline
set splitbelow splitright switchbuf& switchbuf+=useopen hidden
set complete& complete+=k
set completeopt& completeopt+=longest,preview
set wildmenu wildmode=longest,full
set timeoutlen=1000 ttimeoutlen=50 lazyredraw
set noswapfile nobackup viminfo='500,<500,s50,h,rA:,rB:
set number mouse=a
set laststatus=2
set undodir=~/.vim/undo
set undofile

" Mappings
nmap <leader><leader> :source $MYVIMRC<cr>
" Physical moving
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" Yank to the end of line. (It is same as C and D)
nnoremap Y y$
" Very magic by default.
nnoremap / /\v
nnoremap ? ?\v

" Repeat on Visual-mode.
vnoremap <silent> . :normal .<CR>
vnoremap <silent> @q :normal @q<CR>

" Scroll + Move
nnoremap <C-j> <C-e>gj
nnoremap <C-k> <C-y>gk

" Don't use commands.
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap <C-z> <Nop>
noremap <F1> <Nop>

" Quick save, quit and undo
nnoremap <silent> <c-s> :<C-u>update<CR>
nnoremap <silent> <c-q> :<C-u>bd<CR>
inoremap <silent> <c-s> <Esc>:<C-u>update<CR>
imap <silent> <c-z> <c-o>u

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd
command! Q q

" Move between splits
nnoremap <tab> <c-w>w

cnoremap <C-a> <Home>

let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_vimballPlugin = 1
let g:ruby_no_expensive = 1
let g:ruby_no_special_methods = 1

" konsole change cursor on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
