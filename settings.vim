scriptencoding utf-8

set number
set numberwidth=1
set display=lastline
set noruler
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set showmatch
set matchtime=1
set shortmess+=I
set cmdheight=1 cmdwinheight=10
set showbreak=\\\
set fillchars+=diff:⣿
set diffopt=vertical
set diffopt+=filler
set diffopt+=iwhite
set mouse=a
set mousemodel=popup_setpos
set nofoldenable
set splitbelow
set splitright
set nostartofline
set equalalways
set synmaxcol=300
set modeline

set complete=.,w,b,u,t,i
set complete&
set completeopt=preview
set completeopt=menuone
set completeopt=noinsert
set completeopt=noselect
set omnifunc=syntaxcomplete#Complete
set infercase
set showfulltag
set pumheight=10

set wildmenu
set wildmode=full
set wildchar=9

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smartindent
set autoindent
set formatoptions=qrn1j
set formatoptions-=o

set spelllang=en

set incsearch
set ignorecase
set smartcase
set hlsearch|nohlsearch

set noswapfile
set nobackup
set history=1000

set clipboard=unnamedplus

set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw
set updatetime=750

set autoread
set backspace=indent,eol,start
set hidden
set switchbuf=useopen

set virtualedit=block
set whichwrap=b,s,h,l,[,],<,>
set wrap
set nojoinspaces

set wildcharm=<C-z>

set noerrorbells visualbell t_vb=

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
  endif
endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%8*\ %{GitInfo()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
