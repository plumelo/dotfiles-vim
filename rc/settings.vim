set guioptions-=M
set shortmess=I
set autoread
set cursorline
set spelllang=en
set clipboard=unnamed
set ignorecase smartcase incsearch hlsearch
set shiftround softtabstop=-1 shiftwidth=0 tabstop=2 expandtab
set backspace=indent,eol,start whichwrap=b,s,<,>,[,] nostartofline
" set list listchars=tab:▸\ ,trail:.
if exists('+breakindent')
  set breakindent
  set breakindentopt=shift:-4
  let &showbreak = '>>> '
endif
set splitbelow splitright switchbuf& switchbuf+=useopen hidden
set diffopt+=vertical
" set completeopt-=longest
" set completeopt+=menuone
" set completeopt-=menu
" set completeopt-=preview
set complete=.,w,b,u,U,t,i,d
" if &completeopt !~# 'noinsert\|noselect'
"   set completeopt+=noselect
" endif
set wildmenu wildmode=longest,full
set timeoutlen=1000 ttimeoutlen=50 lazyredraw
set noswapfile nobackup
set number mouse=a
set laststatus=2
