scriptencoding utf-8

function! s:load_editorconfig()
  if findfile('.editorconfig', '.;') != ''
    packadd editorconfig-vim
    EditorConfigReload
    function! FiletypeHook(config)
      if has_key(a:config, 'vim_filetype')
        let &filetype = a:config['vim_filetype']
      endif

      return 0   " Return 0 to show no error happened
    endfunction
    call editorconfig#AddNewHook(function('FiletypeHook'))
  endif
endfunction

autocmd BufEnter * call s:load_editorconfig()
let g:EditorConfig_core_mode = 'python_builtin'
let g:EditorConfig_max_line_indicator = 'exceeding'
let g:EditorConfig_preserve_formatoptions = 1
" let g:EditorConfig_verbose = 1
