Plug 'vim-scripts/LustyExplorer'

  let g:LustyExplorerDefaultMappings = 0
  nnoremap <Leader>f :LustyFilesystemExplorer<CR> " Opens the filesystem explorer.
  nnoremap <Leader>r :LustyFilesystemExplorerFromHere<CR> " Opens the filesystem explorer from the directory of the current file.
  nnoremap <Leader>b :LustyBufferExplorer<CR>" Opens the buffer explorer.
  nnoremap <Leader>g :LustyBufferGrep<CR> " Opens the buffer grep, for searching through all loaded buffers
