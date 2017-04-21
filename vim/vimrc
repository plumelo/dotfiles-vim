" Minimal configuration to set the foundation
" major configuration and settings living in 
" vim/rcfiles and vim/rcplugins

set nocompatible
" need to set the leader before defining any leader mapppings

let mapleader = " "

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call plug#begin('~/.vim/plugged')
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

call s:SourceConfigFilesIn('rcfiles')
