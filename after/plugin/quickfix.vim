scriptencoding utf-8

AutoCmd FileType qf exe max([min([line('$'),&lines/2]),5]).'wincmd _'

" remember cursor line
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif

" auto paste leave
AutoCmd InsertLeave * set nopaste
