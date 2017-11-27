" vimrc
unlet! g:skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

augroup vimrc
  autocmd!
augroup END

if has('vim_starting') && &encoding !=# 'utf-8'
  set encoding=utf-8
endif

set shell=sh

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd vimrc VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

source ~/.vim/plugins.vim
source ~/.vim/theme.vim
source ~/.vim/statusline.vim
source ~/.vim/options.vim
source ~/.vim/mappings.vim
source ~/.vim/autocmd.vim

source ~/.vim/nerdtree.vim
source ~/.vim/dmenu.vim
source ~/.vim/fugitive.vim
