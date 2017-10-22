set guioptions-=M
set shortmess=I
set autoread
set cursorline
set spelllang=en
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed
endif
set ignorecase smartcase incsearch hlsearch
set shiftround softtabstop=-1 shiftwidth=0 tabstop=2 expandtab
set backspace=indent,eol,start whichwrap=b,s,<,>,[,] nostartofline
set list listchars=tab:▸\ ,trail:.
if exists('+breakindent')
  set breakindent
  set breakindentopt=shift:-4
  let &showbreak = '>>> '
endif
set splitbelow splitright switchbuf& switchbuf+=useopen hidden
set diffopt+=vertical
set wildmenu wildmode=longest,full
set timeoutlen=1000 ttimeoutlen=50 lazyredraw
set noswapfile nobackup
set number mouse=a
set laststatus=2
" set complete+=.,w,b,u,U,t,i,d,]
set completeopt+=menu,menuone,preview,noinsert,noselect
set infercase
