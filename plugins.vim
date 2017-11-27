if empty(glob('~/.vim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
endif

set packpath^=~/.vim
silent! packadd minpac

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
 " theme
  call minpac#add('millermedeiros/vim-statline')
  " call minpac#add('Yggdroot/indentLine')

  " files
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('francoiscabrol/ranger.vim', {'type': 'opt'})

  " git
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('sgur/vim-sign-deferred', {'type': 'opt'})
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('iberianpig/tig-explorer.vim')

  " syntax
  call minpac#add('chase/vim-ansible-yaml', {'type': 'opt'})
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('qbbr/vim-twig', {'type': 'opt'})
  call minpac#add('gabrielelana/vim-markdown', {'type': 'opt'})
  call minpac#add('chr4/nginx.vim', {'type': 'opt'})
  call minpac#add('dag/vim-fish', { 'type': 'opt' })

  " enhancemets
  call minpac#add('thirtythreeforty/lessspace.vim', {'type': 'opt'})
  call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
  call minpac#add('tpope/vim-rsi', {'type': 'opt'})
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('kana/vim-niceblock')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('itchyny/vim-parenmatch')
  call minpac#add('bronson/vim-visual-star-search')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('Yggdroot/indentLine')

  " " completion
  call minpac#add('Shougo/neocomplete.vim', {'type': 'opt'})
  call minpac#add('KeyboardFire/vim-minisnip', {'type': 'opt'})

  " linter
  call minpac#add('w0rp/ale', {'type': 'opt'})

  " search
  call minpac#add('gabesoft/vim-ags')

endif

com! PackClean     packadd minpac | call minpac#clean()
com! PackUpdate    packadd minpac | call minpac#clean() | call minpac#update()

if !has('vim_starting')
  syntax enable
  filetype plugin indent on
endif
