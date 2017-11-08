scriptencoding utf-8

" automatic location/quickfix window
autocmd vimrc QuickFixCmdPost [^l]* cwindow
autocmd vimrc QuickFixCmdPost    l* lwindow
autocmd vimrc VimEnter            * cwindow
" Git-specific settings
autocmd vimrc FileType gitcommit nnoremap <buffer> { ?^@@<CR>|nnoremap <buffer> } /^@@<CR>|setlocal iskeyword+=-
augroup END

" commands for adjusting indentation rules manually
command! -nargs=1 Spaces execute "setlocal tabstop=" . <args> . " shiftwidth=" . <args> . " softtabstop=" . <args> . " expandtab" | setlocal ts? sw? sts? et?
command! -nargs=1 Tabs   execute "setlocal tabstop=" . <args> . " shiftwidth=" . <args> . " softtabstop=" . <args> . " noexpandtab" | setlocal ts? sw? sts? et?

" smooth searching
cnoremap <expr> <Tab>   getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>?<C-r>/" : "<S-Tab>"


" :h last-position-jump
autocmd vimrc BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" completion in insertmode
autocmd vimrc InsertEnter * call ondemand#completion()

" git gutter
autocmd vimrc BufWinEnter * call ondemand#gitgutter()

" lessspace
autocmd vimrc InsertLeave,InsertChange * call ondemand#lessspace()

" delimitMate
autocmd vimrc InsertEnter * call ondemand#delimitmate()

" rsi
autocmd vimrc InsertEnter * packadd vim-rsi

" minisnip
autocmd vimrc InsertEnter * call ondemand#minisnip()

" ranger
map <leader>f :packadd ranger.vim<CR>:Ranger<CR>

" hl trailing spaces instead of trail:c
function! s:hl_trailing_spaces()
  match ErrorMsg '\s\+$'
endfunction
autocmd vimrc BufWinEnter,ColorScheme * call s:hl_trailing_spaces()
