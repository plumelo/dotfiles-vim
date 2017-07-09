" vimrc
if &compatible
  set nocompatible
endif
let mapleader=','
set packpath^=~/.vim
silent! packadd minpac

if empty(glob('~/.vim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
endif

if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " theme
  call minpac#add('lifepillar/vim-solarized8')
  call minpac#add('bling/vim-airline', {'type': 'opt'})
  " files
  call minpac#add('kien/ctrlp.vim')
  call minpac#add('justinmk/vim-dirvish', {'type': 'opt'})
  call minpac#add('maxboisvert/vim-simple-complete', {'type': 'opt'})
  call minpac#add('jremmen/vim-ripgrep', {'type': 'opt'})
  " editing
  call minpac#add('romainl/vim-cool', {'type': 'opt'})
  call minpac#add('jiangmiao/auto-pairs', {'type': 'opt'})
  call minpac#add('ntpeters/vim-better-whitespace', {'type': 'opt'})
  call minpac#add('farmergreg/vim-lastplace', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  call minpac#add('tpope/vim-unimpaired', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('machakann/vim-sandwich', {'type': 'opt'})
  " git
  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  " syntax
  call minpac#add('sheerun/vim-polyglot', {'type': 'opt'})
  call minpac#add('pearofducks/ansible-vim', {'type': 'opt'})
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('qbbr/vim-twig', {'type': 'opt'})
  call minpac#add('othree/xml.vim')
endif

filetype plugin indent on
syntax on
set t_CO=256
colorscheme solarized8_dark
set background=dark
set encoding=utf-8
set fileencoding=utf-8
" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END
set complete=.,w,b,u,U,t,i,d
set completeopt=menu,preview
set backspace=indent,eol,start
set incsearch
set smartcase
set hlsearch
nnoremap / /\v
set splitbelow
set splitright
set nobackup
set nowritebackup
set noswapfile
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set shiftround
set textwidth=0
set showbreak=↪
set timeout timeoutlen=1000 ttimeout ttimeoutlen=1
set t_md=
set wildmenu
set wildmode=full
set path& | let &path .= "**"
set ruler
set number
set mouse=a
set list
set listchars=tab:▸\ ,trail:.
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set hidden
" mappings
" <Leader>1: Toggle between paste mode
nnoremap <Leader>1 :set invpaste paste?<CR>
" <Leader>q:
nnoremap <Leader>q :bd<cr>
" Make Y yank the rest of the line (like with C and D)
nnoremap Y y$
" windows
nnoremap <C-x> <C-w><C-w>
" Key mapping for tab navigation
nmap <C-Right> ]b
nmap <C-Left> [b
" Spell
map <silent> <F7> :set spell!<CR>
imap <silent> <F7> <Esc> :set spell!<CR>
" double click all word occurences
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
" j and k
nnoremap j gj
nnoremap k gk
" ;: Command mode
noremap ; :
" H: Go to beginning of line.
noremap H ^
" L: Go to end of line
noremap L g_
" Ctrl-s: Save
nmap <c-s> :w!<CR>
" Move current line down
nnoremap <silent> <C-Down> mz:m+<cr>`z==
" Move current line up
nnoremap <silent> <C-Up> mz:m-2<cr>`z==
" Move selections down
vnoremap <C-Down> :m'>+<cr>`<my`>mzgv`yo`z
" Move selections up
vnoremap <C-Up> :m'<-2<cr>`>my`<mzgv`yo`z
" Duplicate line down
nnoremap <silent> <C-S-Down> mzyyp`zj
" Duplicate line up
nnoremap <silent> <C-S-Up> mzyyp`z
" Ctrl-w: Delete previous word, create undo point
inoremap <c-w> <c-g>u<c-w>
" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A
" Ctrl-u: Delete til beginning of line, create undo point
inoremap <c-u> <c-g>u<c-u>
" Ctrl-a: Go to beginig of the line
inoremap <c-a> <esc>I
" Ctrl-s: Save
inoremap <c-s> <esc>:w<CR>
" Ctrl-v: Paste.
inoremap <c-v> <c-g>u<c-o>gP
" Ctrl-/: Undo
inoremap <c-_> <c-o>u
" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
vnoremap <c-c> y`]
" Fix alt key keycodes. Using keycodes instead of escape sequence for mapping will use ttimeout instead of timeout,
" which means pressing escape will not cause a delay.
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "set <A-".toupper(c).">=\e".toupper(c)
  let c = nr2char(1+char2nr(c))
endw
" .: repeats the last command on every line
xnoremap . :normal.<cr>

autocmd MyAutoCmd VimEnter * packadd vim-dirvish
autocmd MyAutoCmd VimEnter * packadd vim-simple-complete
autocmd MyAutoCmd VimEnter * packadd vim-airline
autocmd MyAutoCmd VimEnter * packadd vim-ripgrep
autocmd MyAutoCmd VimEnter * packadd vim-cool
autocmd MyAutoCmd VimEnter * packadd vim-lastplace
autocmd MyAutoCmd VimEnter * packadd vim-better-whitespace
autocmd MyAutoCmd VimEnter * packadd vim-commentary
autocmd MyAutoCmd VimEnter * packadd vim-repeat
autocmd MyAutoCmd VimEnter * packadd vim-unimpaired
autocmd MyAutoCmd VimEnter * packadd vim-sandwich
autocmd MyAutoCmd VimEnter * packadd auto-pairs
autocmd MyAutoCmd VimEnter * packadd vim-fugitive
autocmd MyAutoCmd VimEnter * packadd vim-gitgutter
autocmd MyAutoCmd VimEnter * packadd ansible-vim
autocmd MyAutoCmd VimEnter * packadd Vim-Jinja2-Syntax
autocmd MyAutoCmd VimEnter * packadd vim-twig



" plugins mappings
" completion
let g:vsc_type_complete = 1
let g:vsc_type_complete_length = 1
" statusline
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='¦'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1
" ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
