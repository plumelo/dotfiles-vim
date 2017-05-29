set nu
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
" set visualbell
set backspace=indent,eol,start
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set ttimeoutlen=50 " Time out on key codes
set updatetime=1000 " Idle time to write swap
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
" set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set nocursorline
set nrformats=hex
silent! set cryptmethod=blowfish2

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif
if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" Toggle paste mode
set pastetoggle=<F3>
set modelines=2
set synmaxcol=1000

" ctags
set tags=./tags;/

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" set complete=.,w,b,u,t
set complete-=i

" mouse
silent! set ttymouse=xterm2
set mouse=a

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Keep the cursor on the same column
set nostartofline

" FOOBAR=~/<CTRL-><CTRL-F>
set isfname-==

if exists('&fixeol')
  set nofixeol
endif
