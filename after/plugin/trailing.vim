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
