scriptencoding utf-8

AutoCmd InsertEnter * :set listchars-=trail:⌴
AutoCmd BufEnter,InsertLeave * :set listchars+=trail:⌴

function! <SID>StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap <silent> <Leader>w :call <SID>StripTrailingWhitespace()<CR>

" function! Wht()
"   set conceallevel=2 concealcursor=inc
"   " show leading whitespaces as gray dots
"   syn match LeadingWS /\(^\s*\)\@<=\s/ conceal cchar=·
"   highlight Conceal ctermbg=NONE ctermfg=238
" endfunction

" nnoremap ,l :<C-u>call Wht()<cr
" AutoCmd WinEnter,BufEnter,BufReadPre,BufRead *.json set conceallevel=0
