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

let g:vimrc = expand('<sfile>')
let g:vimrc_root = fnamemodify(g:vimrc, ':h')
let s:rc_base_dir = g:vimrc_root . '/rc/'

execute 'set runtimepath^=' . fnameescape(g:vimrc_root)
execute 'set runtimepath^=' . fnameescape(s:rc_base_dir)

" @param {string} path 'relative to s:rc_base_dir(~/.vim/rc/)'
function! s:source_rc(path) abort
  execute 'source' fnameescape(s:rc_base_dir . a:path)
endfunction

call s:source_rc('options.vim')
call s:source_rc('mapping.vim')
call s:source_rc('autocmd.vim')

call s:source_rc('theme.vim')
call s:source_rc('statusline.vim')
call s:source_rc('plugins.vim')
call s:source_rc('nerdtree.vim')
call s:source_rc('fzf.vim')
call s:source_rc('align.vim')
call s:source_rc('tiler.vim')
call s:source_rc('search.vim')
call s:source_rc('fugitive.vim')
call s:source_rc('ansible.vim')
