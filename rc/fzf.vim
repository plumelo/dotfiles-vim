let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

let g:uncommited_files_options = { 'source': '( git status --porcelain | awk ''{print $2}'' ) | sort | uniq'}
let s:diff_options =
  \ '--preview "git diff --color=always master -- {} | tail -n +5 | head -'.&lines.'"'

command! UncommitedFiles call fzf#run(fzf#wrap('UncommitedFiles',
      \ extend(uncommited_files_options, { 'options': s:diff_options }), 0))
nnoremap <silent> <F5> :UncommitedFiles<cr>

nmap <C-p> :call ondemand#fzf()<CR>:Files<CR>
nmap <C-t> :call ondemand#fzf()<CR>:Filetypes<CR>
nmap ,l    :call ondemand#fzf()<CR>:Buffers<CR>
nmap ,m    :call ondemand#fzf()<CR>:Marks<CR>
nmap ,h    :call ondemand#fzf()<CR>:History<CR>
