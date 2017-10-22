" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

set shell=sh

set packpath^=~/.vim
silent! packadd minpac

if empty(glob('~/.vim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
endif

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
 "Theme
  " call minpac#add('rafi/vim-tinyline')
  " call minpac#add('t9md/vim-ezbar')
  call minpac#add('itchyny/lightline.vim')

  "Tree/Files
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('Xuyuanp/git-nerdtree', {'type': 'opt'})
  call minpac#add('ctrlpvim/ctrlp.vim')

  "Syntax
  call minpac#add('pearofducks/ansible-vim', {'type': 'opt'})
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('qbbr/vim-twig', {'type': 'opt'})
  call minpac#add('shime/vim-livedown', {'type': 'opt'})
  call minpac#add('chr4/nginx.vim', {'type': 'opt'})

  " Others
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('thirtythreeforty/lessspace.vim', {'type': 'opt'})
  call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
  call minpac#add('tpope/vim-rsi', {'type': 'opt'})
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('romainl/vim-cool', {'type': 'opt'})
  call minpac#add('rhysd/clever-f.vim', {'type': 'opt'})
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  call minpac#add('tpope/vim-dispatch', {'type': 'opt'})
  call minpac#add('kana/vim-niceblock', {'type': 'opt'})
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  call minpac#add('christoomey/vim-system-copy', {'type': 'opt'})
  call minpac#add('zhamlin/tiler.vim', {'type': 'opt'})


  " Completion
  call minpac#add('dirkwallenstein/vim-autocomplpop', {'type': 'opt'})
  call minpac#add('dirkwallenstein/vim-localcomplete', {'type': 'opt'})
  call minpac#add('vim-scripts/L9')
  " Git
  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})

  " Linter
  call minpac#add('w0rp/ale', {'type': 'opt'})

  " Search
  call minpac#add('Shougo/vimproc.vim', {'do': 'silent! !make'})
  call minpac#add('ggreer/the_silver_searcher', {'type': 'opt'})
  call minpac#add('gabesoft/vim-ags', {'type': 'opt'})

endif

filetype plugin indent on
syntax on
" colorscheme monokai
" hi Comment cterm=italic

" if has('termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif
runtime! /config/colors.vim
if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  set encoding=utf-8
endif

scriptencoding utf-8

