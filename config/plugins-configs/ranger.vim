" Ranger
function! OpenRanger(selectFile)
  let l:tempFilePath = tempname()
  let l:cmd = 'ranger --choosefiles=' . shellescape(l:tempFilePath)

  let l:file = expand('%:f:h')
  if a:selectFile == 1 && l:file != ''
    let l:cmd .= ' --selectfile=' . shellescape(l:file)
  endif

  if has('nvim')
    let l:rangerCallback = { 'name': 'ranger' , 'tempFilePath': l:tempFilePath }

    function! l:rangerCallback.on_exit(id, code, event)
      Bdelete!

      if filereadable(self.tempFilePath)
        for l:file in readfile(self.tempFilePath)
          exec 'edit ' . l:file
        endfor

        call delete(self.tempFilePath)
      endif
    endfunction

    enew

    call termopen(l:cmd, l:rangerCallback)

    startinsert
  else
    exec 'silent !' . l:cmd

    if filereadable(l:tempFilePath)
      for l:file in readfile(l:tempFilePath)
        exec 'edit ' . l:file
      endfor

      call delete(l:tempFilePath)
    endif

    redraw!
  endif
endfunction

noremap <silent> <leader>r :call OpenRanger(1)<cr>

